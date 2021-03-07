//
//  ChaupaiView.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 25/2/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import SwiftUI


struct ChaupaiView: View {
    
    @ObservedObject var viewModel = SavedChaupaiViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.chaupaiList) { chaupai in
                    SavedChaupaiItemView(chaupai: chaupai)
                }
            }
            .padding(.bottom, 10)
            .navigationBarTitle("चौपाइ", displayMode: .automatic)
        }
    }
}

struct SavedChaupaiItemView: View {
    
    var chaupai: SavedChaupai
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 15) {
            Image(systemName: "book.fill").resizable().foregroundColor(.black).frame(width: 44, height: 44, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading) {
                Text(chaupai.chaupaiTitle).foregroundColor(.black).font(Theme.shared.titleFont).lineLimit(1)
                Text("\(chaupai.bookTitle) : \(chaupai.page)").foregroundColor(.black).font(Theme.shared.subTitleFont).lineLimit(1)
            }
        }
        .padding()
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
    }
    
}
