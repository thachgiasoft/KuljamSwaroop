//
//  DashboardView.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 25/2/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
    
    @ObservedObject var viewModel = DashboardViewModel()
    
    var body: some View {
        
        VStack {
            Spacer(minLength: 20)
            Image("raj_shyama").resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300, alignment: .center)
                .cornerRadius(150)
            ChaupaiCarousel(UIState: UIStateModel(), chaupais: viewModel.chaupais)

        }.padding()
    }
}


struct ChaupaiItemView: View {
    
    var chaupai: Chaupai
    
    var body: some View {
        VStack {
            Text(chaupai.title).foregroundColor(.white).font(Font.system(size: 22, weight: .bold, design: .default)).lineLimit(1).multilineTextAlignment(.center).padding(.bottom, 8)
            Text(chaupai.desc).foregroundColor(.white).font(Font.system(size: 18, weight: .semibold, design: .default)).multilineTextAlignment(.center)
        }
    }
}

struct ChaupaiCarousel: View
{
    
    var UIState: UIStateModel
    var chaupais: [Chaupai]
    
    var body: some View
    {
        let spacing: CGFloat = 10
        let widthOfHiddenCards: CGFloat = 20
        let cardHeight: CGFloat = 150
        
        return Canvas {
            Carousel(numberOfItems: CGFloat(chaupais.count), spacing: spacing, widthOfHiddenCards: widthOfHiddenCards )  {
                ForEach(chaupais, id: \.self.id ) { chaupai in
                    Item(_id: Int(chaupai.id), spacing: spacing, widthOfHiddenCards: widthOfHiddenCards, cardHeight: cardHeight) {
                            ChaupaiItemView(chaupai: chaupai)
                        }
                    .background(Color("BrandColor"))
                    .cornerRadius(8)
                    .shadow(color: Color.gray, radius: 4, x: 0, y: 4)
                    .transition(AnyTransition.slide)
                    .animation(.spring())
                }
            }
        .environmentObject( self.UIState )
        }
    }
}
