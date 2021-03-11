//
//  Chaupai+CoreDataProperties.swift
//  
//
//  Created by Dipesh Dhakal on 11/3/21.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Chaupai {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Chaupai> {
        return NSFetchRequest<Chaupai>(entityName: "Chaupai")
    }

    @NSManaged public var chaupaiNumber: Int16
    @NSManaged public var documentURL: String?
    @NSManaged public var id: UUID?
    @NSManaged public var pageNumber: Int16
    @NSManaged public var remoteURL: String?
    @NSManaged public var chaupaiTitle: String?
    @NSManaged public var bookName: String?

}

extension Chaupai : Identifiable {

}
