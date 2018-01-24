//
//  Post+CoreDataProperties.swift
//  
//
//  Created by ABA IT on 1/22/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var id: Int32
    @NSManaged public var imageURL: String?
    @NSManaged public var thumbImageURL: String?
    @NSManaged public var title: String?

}
