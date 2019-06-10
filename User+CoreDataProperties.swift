//
//  User+CoreDataProperties.swift
//  UnknownHand
//
//  Created by moontai0724 on 2019/6/10.
//  Copyright © 2019 moontai0724. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var account: String?
    @NSManaged public var isLogin: Bool
    @NSManaged public var password: String?

}
