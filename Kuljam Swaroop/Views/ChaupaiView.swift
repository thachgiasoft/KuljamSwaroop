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
                    NavigationLink(destination: PDFViewer(displayPDF: chaupai)) {
                        SavedChaupaiItemView(chaupai: chaupai)
                    }
                 }
            }
            .padding(.bottom, 10)
            .navigationBarTitle("चौपाइ", displayMode: .automatic)
        }
    }
}

struct SavedChaupaiItemView: View {
    
    var chaupai: SavedChaupai
    @State private var showingAlert = false
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 15) {
            Image(systemName: "note.text.badge.plus").resizable().foregroundColor(.black).frame(width: 44, height: 44, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading) {
                Text(chaupai.chaupaiTitle).foregroundColor(.black).font(Theme.shared.titleFont).lineLimit(1)
                Text("\(chaupai.bookTitle) : \(chaupai.page)").foregroundColor(.black).font(Theme.shared.subTitleFont).lineLimit(1)
            }
            Spacer()
            Button("Delete") {
                showingAlert = true
            }.padding(.trailing, 10)
            .alert(isPresented:$showingAlert) {
                        Alert(
                            title: Text("Are you sure you want to delete this?"),
                            message: Text("There is no undo"),
                            primaryButton: .destructive(Text("Delete")) {
                                SavedChaupaiViewModel().deleteChaupai(chaupaiID: chaupai.id)
                            },
                            secondaryButton: .cancel()
                        )
                }.buttonStyle(PlainButtonStyle())
        }
        .padding()
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
    }
    
}
