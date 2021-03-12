//
//  BookList.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 2/3/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import SwiftUI

class BookListViewModel {
    
    lazy var books: [Book] = {
        return [Book(id: 0, title: "raas", englishName: "Raas", hindiName: "रास"),
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
    }()
    
    var rowCount: Int {
        return books.count / 2 + (books.count % 2)
    }
    
    var columnCount: Int {
        return 2
    }
    
    func getBook(_ row: Int, _ column: Int) -> Book? {
        let index = row * columnCount + column
        if index < books.count {
            return books[index]
        }
        return nil
    }
    
}


struct Book: Hashable, Identifiable, PDFDisplayable {
    
    var id: Int
    var title: String
    var englishName: String
    var hindiName: String
    
    var displayTitle: String {
        return hindiName
    }
    
    var pdfRemoteURL: URL {
        return Bundle.main.url(forResource: title, withExtension: "pdf")!
    }

}
