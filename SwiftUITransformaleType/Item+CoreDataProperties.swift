//
//  Item+CoreDataProperties.swift
//  SwiftUITransformaleType
//
//  Created by Shin yongjun on 2022/11/19.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var strArray: [String]

}

extension Item : Identifiable {

}
