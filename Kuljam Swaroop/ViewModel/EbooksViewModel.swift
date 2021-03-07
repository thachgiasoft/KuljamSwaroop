//
//  EbooksViewModel.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 6/3/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import Firebase
import SwiftUI
import Combine

class EbooksViewModel: ObservableObject {
    
    var reference: DatabaseReference
    
    @Published var ebooks: [Ebook] = []
    
    init() {
        reference = Database.database().reference().child("Ebooks")
        listChaupais()
    }

    func listChaupais() {
        reference.observe(.value, with: { (snapshot) in
            
            self.ebooks  = []
            var count = 0
            
            for snap in snapshot.children {
                if let snap = snap as? DataSnapshot {
                    let dict = snap.value as! [String: Any]
                    let name = dict["title"] as? String ?? ""
                    let url = dict["url"] as? String ?? ""
                    let author = dict["author"] as? String ?? ""
                    self.ebooks.append(Ebook(id: count, title: name, url: url, author: author))
                    count += 1
                }
            }
        })
    }
    
    var rowCount: Int {
        return ebooks.count / 2 + (ebooks.count % 2)
    }
    
    var columnCount: Int {
        return 2
    }
    
    func getEbook(_ row: Int, _ column: Int) -> Ebook? {
        let index = row * columnCount + column
        if index < ebooks.count {
            return ebooks[index]
        }
        return nil
    }
}


struct Ebook: Identifiable, PDFDisplayable {
    
    var id: Int
    var title: String
    var url: String
    var author: String
    
    var navigationTitle: String {
        return title
    }
    
    var pdfURL: URL {
        if isRemote {
            return URL(string: url)!
        } else {
            return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!.appendingPathComponent(URL(string: url)!.lastPathComponent)
        }
    }
    
    var isRemote: Bool {
        if let cachesDirectoryUrl =  FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first {
            let dataURL = cachesDirectoryUrl.appendingPathComponent(URL(string: url)!.lastPathComponent)
            do {
                _ = try Data(contentsOf: dataURL)
                return false
            } catch _ {
                return true
            }
        } else {
            return true
        }
    }

}
