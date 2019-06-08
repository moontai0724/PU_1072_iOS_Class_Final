//
//  User+CoreDataProperties.swift
//  UnKnownHand
//
//  Created by ohfreeya on 2019/6/8.
//  Copyright © 2019年 ohfreeya. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User");
    }

    @NSManaged public var id: Int32
    @NSManaged public var acount: Int32
    @NSManaged public var password: String?
    @NSManaged public var isLogin: Bool

}
