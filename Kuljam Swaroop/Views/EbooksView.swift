//
//  EbooksView.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 25/2/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import SwiftUI

struct Book: Hashable {

    var id: Int
    var title: String
    var englishName: String
    var hindiName: String

}

struct EbooksView: View {
    
    let books: [Book] = [Book(id: 0,title: "raas", englishName: "Raas", hindiName: "रास"),
                        Book(id: 1, title: "prakashhindusthani", englishName: "Prakash Hindusthani", hindiName: "प्रकाश  हिन्दूस्तानी"),
                        Book(id: 2, title: "prakashgujhrati", englishName: "Prakash Gujrati", hindiName: "प्रकाश  गुजराती"),
                        Book(id: 3, title: "khataritu", englishName: "Khataritu", hindiName: "खटरितु"),
                        Book(id: 4, title: "kalashhindi", englishName: "Kalash Hindi", hindiName: "कलश हिन्दी"),
                        Book(id: 5, title: "kalashgujhrati", englishName: "Kalash Gujrati", hindiName: "कलश गुजराती"),
                        Book(id: 6, title: "sagar", englishName: "Sagar", hindiName: "सागर"),
                        Book(id: 7, title: "singar", englishName: "Singar", hindiName: "सिनगार"),
                        Book(id: 8, title: "sanandha", englishName: "Sananda", hindiName: "सनन्ध"),
                        Book(id: 9, title: "sindhi", englishName: "Sindhi", hindiName: "सिन्धी"),
                        Book(id: 10, title: "parikrama", englishName: "Parikrama", hindiName: "पारीक्रमा"),
                        Book(id: 11, title: "kirantan", englishName: "Kirantan", hindiName: "किरंतन"),
                        Book(id: 12, title: "marfat", englishName: "Marfat", hindiName: "मारफत"),
                        Book(id: 13, title: "khulasa", englishName: "Khulasha", hindiName: "खुलाशा"),
                        Book(id: 14, title: "khilawat", englishName: "Khilawat", hindiName: "खिलवत"),
                        Book(id: 15, title: "chhotekayamatnama", englishName: "Chhote Kyamatnama", hindiName: "छोटे क्यामत्नामा"),
                        Book(id: 16, title: "badekayamatnama", englishName: "Bade Kyamatnama", hindiName: "बडे क्यामत्नामा")]
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0..<books.count/2) { row in
                    HStack {
                        ForEach(0..<2) { column in
                            BookItemView(book: self.books[row * 2 + column])
                        }.background(Config.shared.brandColor)
                        .cornerRadius(15)
                        .shadow(color: .gray, radius: 5)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 5, trailing: 10))
                    }
                }
            }.navigationBarTitle("Kuljam Swaroop")
        }
    }
}


struct BookItemView: View {
    
    var book: Book
    
    var body: some View {
        
        VStack {
            Image(systemName: "book.fill").resizable().foregroundColor(.white).frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(book.hindiName).foregroundColor(.white).font(Font.system(size: 20, weight: .bold, design: .default)).lineLimit(1)
            Text(book.englishName).foregroundColor(.white).font(Font.system(size: 18, weight: .semibold, design: .default)).lineLimit(1)
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
    }
    
}


struct EbooksView_Previews: PreviewProvider {
    static var previews: some View {
        BookItemView(book: Book(id: 1, title: "Praksah Hindusthani", englishName: "Praksah Hindusthani", hindiName: "Praksah Hindusthani"))
    }
}
