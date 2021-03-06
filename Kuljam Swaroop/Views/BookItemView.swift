//
//  BookItemView.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 2/3/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import SwiftUI

struct BookItemView: View {
    
    var book: Book
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "book.fill").resizable().foregroundColor(.white).frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(book.hindiName).foregroundColor(.white).font(Font.system(size: 20, weight: .bold, design: .default)).lineLimit(1)
            Text(book.englishName).foregroundColor(.white).font(Font.system(size: 18, weight: .semibold, design: .default)).lineLimit(1)
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


struct EmptyView: View {
    
    var body: some View {
        Color.clear
    }
    
}
