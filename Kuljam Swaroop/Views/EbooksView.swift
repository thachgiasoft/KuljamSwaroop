//
//  EbooksView.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 25/2/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import SwiftUI

struct EbooksView: View {
    
    @ObservedObject var viewModel = EbooksViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                
                GridView(rows: viewModel.rowCount, columns: viewModel.columnCount) { row, column in
                    if let ebook = viewModel.getEbook(row, column) {
                        NavigationLink(destination: PDFViewer(displayPDF: ebook)) {
                            EbookItemView(ebook: ebook)
                        }
                    } else {
                        EmptyView()
                    }
                }
            }.padding(.bottom, 10)
            .navigationBarTitle("साहित्य", displayMode: .automatic)
        }
    }
}


struct EbookItemView: View {
    
    var ebook: Ebook
    
    var body: some View {
        
        VStack(alignment: .center) {
            Image(systemName: "book.fill").resizable().foregroundColor(.white).frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(ebook.title).foregroundColor(.white).font(Font.system(size: 20, weight: .bold, design: .default)).lineLimit(1)
            Text(ebook.author).foregroundColor(.white).font(Font.system(size: 18, weight: .semibold, design: .default)).lineLimit(1)
        }
        .padding()
        .frame(minWidth: 0,
                maxWidth: .infinity
        ).background(Color("BrandColor"))
        .cornerRadius(15)
        .shadow(color: .gray, radius: 5)
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
    }
    
}
