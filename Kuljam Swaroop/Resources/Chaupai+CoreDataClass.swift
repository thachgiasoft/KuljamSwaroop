//
//  Chaupai+CoreDataClass.swift
//  
//
//  Created by Dipesh Dhakal on 11/3/21.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(Chaupai)
public class Chaupai: NSManagedObject {

}

extension Chaupai : PDFDisplayable {
    
    public var navigationTitle: String {
        return bookName ?? ""
    }
    
    public var pdfURL: URL {
        return URL(string: documentURL ?? "")!
    }
    
    public var isRemote: Bool {
        return false
    }
    

}
