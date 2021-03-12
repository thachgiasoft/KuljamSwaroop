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
    
    @FetchRequest(fetchRequest: PersistenceProvider.default.allListsRequest) var chaupais: FetchedResults<Chaupai>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(chaupais) { chaupai in
                    NavigationLink(destination: PDFViewer(displayPDF: chaupai)) {
                        HStack {
                            Image(systemName: "book.fill").resizable().foregroundColor(Color("BrandColor")).frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            VStack(alignment: .leading) {
                                Text(chaupai.chaupaiTitle ?? "").font(.headline)
                                Text("\(chaupai.bookName ?? "") : \(chaupai.pageNumber)").font(.subheadline)
                            }.padding(.leading, 5)
                            Spacer()
                        }.padding()
                    }                    
                }
                    .onDelete { indexSet in
                        for index in indexSet {
                            PersistenceProvider.default.delete(chaupais[index])
                        }
                    }
            }
                .listStyle(PlainListStyle())
                .navigationTitle("My Chaupais")
        }
    }
}

