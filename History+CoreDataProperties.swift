//
//  History+CoreDataProperties.swift
//  UnknownHand
//
//  Created by moontai0724 on 2019/6/10.
//  Copyright © 2019 moontai0724. All rights reserved.
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
    @NSManaged public var systemPunched: Int16
    @NSManaged public var userPunched: Int16
    @NSManaged public var result: String?

}
