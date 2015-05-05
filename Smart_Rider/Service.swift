//
//  Service.swift
//  
//
//  Created by Macmini_Dagon on 05.05.15.
//
//

import Foundation
import CoreData

class Service: NSManagedObject {

    @NSManaged var servicedate: NSDate
    @NSManaged var servicekilometre: String
    @NSManaged var fait: NSNumber
    @NSManaged var identifier: String
    @NSManaged var moto: Moto

}
