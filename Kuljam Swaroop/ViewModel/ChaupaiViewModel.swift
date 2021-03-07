//
//  ChaupaiViewModel.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 7/3/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import SwiftUI

class SavedChaupaiViewModel: ObservableObject {
    
    @Published var chaupaiList: [SavedChaupai] = []
    
    let chaupaiPreferenceKey = "SAVED_CHAUPAI_KEY"
    
    init() {
        chaupaiList = savedChaupais
    }
    
    var savedChaupais: [SavedChaupai] {
        
        
        guard let decodedChaupais = UserDefaults.standard.data(forKey: chaupaiPreferenceKey), let chaupais = NSKeyedUnarchiver.unarchiveObject(with: decodedChaupais) as? [SavedChaupai] else {
            return []
        }
        return chaupais
    }
    
    func saveChaupai(chaupaiTitle: String, book: PDFDisplayable, page: Int, chaupaiNumber: Int) {
        chaupaiList = savedChaupais
        chaupaiList.append(SavedChaupai(id: 0, bookURL: book.pdfURL, bookTitle: book.navigationTitle, chaupaiNumber: chaupaiNumber, chaupaiTitle: chaupaiTitle, page: page))
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: chaupaiList)
        let userDefaults = UserDefaults.standard
        userDefaults.set(encodedData, forKey: chaupaiPreferenceKey)
        userDefaults.synchronize()
    }
    
}


class SavedChaupai: NSObject, Identifiable, NSCoding {
    
    var id: Int
    var bookURL: URL
    var bookTitle: String
    var chaupaiNumber: Int
    var chaupaiTitle: String
    var page: Int
    
    internal init(id: Int, bookURL: URL, bookTitle: String, chaupaiNumber: Int, chaupaiTitle: String, page: Int) {
        self.id = id
        self.bookURL = bookURL
        self.bookTitle = bookTitle
        self.chaupaiNumber = chaupaiNumber
        self.chaupaiTitle = chaupaiTitle
        self.page = page
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(id, forKey: "id")
        coder.encode(bookURL, forKey: "bookURL")
        coder.encode(bookTitle, forKey: "bookTitle")
        coder.encode(chaupaiNumber, forKey: "chaupaiNumber")
        coder.encode(chaupaiTitle, forKey: "chaupaiTitle")
        coder.encode(page, forKey: "page")
    }
    
    required convenience init?(coder: NSCoder) {
        let id = coder.decodeInteger(forKey: "id") as! Int
        let bookURL = coder.decodeObject(forKey: "bookURL") as! URL
        let bookTitle = coder.decodeObject(forKey: "bookTitle") as! String
        let chaupaiNumber = coder.decodeObject(forKey: "chaupaiNumber") as? Int ?? 0
        let chaupaiTitle = coder.decodeObject(forKey: "chaupaiTitle") as! String
        let page = coder.decodeObject(forKey: "page") as? Int ?? 0
        self.init(id: id, bookURL: bookURL, bookTitle: bookTitle, chaupaiNumber: chaupaiNumber, chaupaiTitle: chaupaiTitle, page: page)
    }
}
