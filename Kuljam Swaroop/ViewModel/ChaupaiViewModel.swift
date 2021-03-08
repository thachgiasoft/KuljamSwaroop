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
    
    var observer: NSKeyValueObservation?
    
    init() {
        chaupaiList = savedChaupais
        
        observer = UserDefaults.standard.observe(\.chaupaiListData, options: [.initial, .new], changeHandler: { (defaults, change) in
            self.chaupaiList = self.savedChaupais
        })
    }
    
    deinit {
        observer?.invalidate()
    }
    
    func deleteChaupai(chaupaiID: Int) {
        
        if let chaupaiIndex = chaupaiList.firstIndex(where: {$0.id == chaupaiID}) {
            chaupaiList.remove(at: chaupaiIndex)
        }
        saveChaupai()
    }
    
    func addChaupai(chaupaiTitle: String, book: PDFDisplayable, page: Int, chaupaiNumber: Int) {
        
        chaupaiList = savedChaupais
        chaupaiList.append(SavedChaupai(id: UUID().hashValue, bookURL: book.pdfURL, bookTitle: book.navigationTitle, chaupaiNumber: chaupaiNumber, chaupaiTitle: chaupaiTitle, page: page))
        saveChaupai()
    }
    
    var savedChaupais: [SavedChaupai] {
        
        guard let decodedChaupais = UserDefaults.standard.chaupaiListData, let chaupais = NSKeyedUnarchiver.unarchiveObject(with: decodedChaupais) as? [SavedChaupai] else {
            return []
        }
        return chaupais
    }
    
    func saveChaupai() {
        
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: chaupaiList)
        UserDefaults.standard.chaupaiListData = encodedData
        
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
        let id = coder.decodeInteger(forKey: "id")
        let bookURL = coder.decodeObject(forKey: "bookURL") as! URL
        let bookTitle = coder.decodeObject(forKey: "bookTitle") as! String
        let chaupaiNumber = coder.decodeInteger(forKey: "chaupaiNumber")
        let chaupaiTitle = coder.decodeObject(forKey: "chaupaiTitle") as! String
        let page = coder.decodeInteger(forKey: "page")
        self.init(id: id, bookURL: bookURL, bookTitle: bookTitle, chaupaiNumber: chaupaiNumber, chaupaiTitle: chaupaiTitle, page: page)
    }
}

extension SavedChaupai: PDFDisplayable {
    
    var navigationTitle: String {
        return bookTitle
    }
    
    var pdfURL: URL {
        return bookURL
    }
    
    var isRemote: Bool {
        return false
    }
    
    
}
