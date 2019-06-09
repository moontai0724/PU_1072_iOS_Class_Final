//
//  User+CoreDataProperties.swift
//  UnKnownHand
//
//  Created by moontai0724 on 2019/6/9.
//  Copyright © 2019 ohfreeya. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var account: String?
    @NSManaged public var password: String?
    @NSManaged public var isLogin: Bool

}
