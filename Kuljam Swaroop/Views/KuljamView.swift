//
//  KuljamView.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 25/2/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import SwiftUI
import PDFViewer

struct KuljamView: View {
    
    let bookListViewModel = BookListViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                GridView(rows: bookListViewModel.rowCount, columns: bookListViewModel.columnCount) { row, column in
                    if let book = bookListViewModel.getBook(row, column) {
                        NavigationLink(destination: PDFViewer(displayPDF: book)) {
                            BookItemView(book: book)
                        }
                    } else {
                        EmptyView()
                    }
                }
            }.padding(.bottom, 10)
            .navigationBarTitle("कुल्जम स्वरूप")
        }
    }
}
