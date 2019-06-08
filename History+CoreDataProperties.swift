//
//  History+CoreDataProperties.swift
//  UnKnownHand
//
//  Created by ohfreeya on 2019/6/8.
//  Copyright © 2019年 ohfreeya. All rights reserved.
//

import Foundation
import CoreData


extension History {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<History> {
        return NSFetchRequest<History>(entityName: "History");
    }

    @NSManaged public var id: Int32
    @NSManaged public var userid: Int32
    @NSManaged public var punched: Int16
    @NSManaged public var rival: Int16
    @NSManaged public var thewin: String?

}
