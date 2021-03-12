//
//  Persistance+Chaupai.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 11/3/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import Foundation

import Foundation
import CoreData

extension PersistenceProvider {
    
    var allListsRequest: NSFetchRequest<Chaupai> {
        let request: NSFetchRequest<Chaupai> = Chaupai.fetchRequest()
        request.sortDescriptors = []
        return request
    }
    
    func saveChaupai(chaupaiTitle: String, documentURL: String, pageNumber: Int16, chaupaiNumber: Int16, bookName: String) {
        
        let newChaupai = Chaupai(context: context)
        newChaupai.chaupaiTitle = chaupaiTitle
        newChaupai.documentURL = documentURL
        newChaupai.pageNumber = pageNumber
        newChaupai.chaupaiNumber = chaupaiNumber
        newChaupai.bookName = bookName
        newChaupai.id = UUID()
        
        context.performAndWait {
            try? context.save()
        }
        
    }
    
    func delete(_ chaupai: Chaupai) {
        context.delete(chaupai)
        try? context.save()
    }
}
