//
//  History+CoreDataProperties.swift
//  UnKnownHand
//
//  Created by moontai0724 on 2019/6/9.
//  Copyright © 2019 ohfreeya. All rights reserved.
//
//

import Foundation
import CoreData


extension History {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<History> {
        return NSFetchRequest<History>(entityName: "History")
    }

    @NSManaged public var account: String?
    @NSManaged public var id: Int32
    @NSManaged public var punched: Int16
    @NSManaged public var rival: Int16
    @NSManaged public var userWin: Bool

}
