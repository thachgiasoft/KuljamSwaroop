//
//  ContentView.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 25/2/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            TabView {
                 DashboardView()
                   .tabItem {
                      Image(systemName: "squareshape.squareshape.dashed")
                      Text("Nijanand")
                 }
                 EbooksView()
                   .tabItem {
                      Image(systemName: "text.book.closed.fill")
                      Text("Kuljam")
                }
                KuljamView()
                   .tabItem {
                      Image(systemName: "books.vertical")
                      Text("Ebooks")
                }
                ChaupaiView()
                   .tabItem {
                      Image(systemName: "square.and.arrow.down.on.square")
                      Text("Chaupai")
                }
            }
        }

    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
