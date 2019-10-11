//
//  Article+CoreDataProperties.swift
//  mzhurba2019
//
//  Created by Mykola ZHURBA on 10/11/19.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var content: String?
    @NSManaged public var created_at: NSDate?
    @NSManaged public var image: NSData?
    @NSManaged public var language: String?
    @NSManaged public var title: String?
    @NSManaged public var updated_at: NSDate?

    override public var description: String {
        return "\(title!)\n\(content!)\n\(language!)\n\(created_at!)\n\(updated_at!)\n"
    }
}
