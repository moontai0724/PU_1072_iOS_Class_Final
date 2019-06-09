//
//  User+CoreDataProperties.swift
//  UnKnownHand
//
//  Created by ＣＭＲＤＢ on 2019/6/9.
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
    @NSManaged public var id: Int32
    @NSManaged public var isLogin: Bool
    @NSManaged public var password: String?

}
