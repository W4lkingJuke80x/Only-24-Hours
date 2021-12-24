//
//  Goal+CoreDataProperties.swift
//  Only 24 Hours
//
//  Created by Dauren Omarov on 23.12.2021.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var detail: String?
    @NSManaged public var from: String?
    @NSManaged public var note: String?
    @NSManaged public var title: String?
    @NSManaged public var to: String?

}

extension Goal : Identifiable {

}
