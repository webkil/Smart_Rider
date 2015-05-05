//
//  Moto.swift
//  
//
//  Created by Macmini_Dagon on 05.05.15.
//
//

import Foundation
import CoreData

class Moto: NSManagedObject {
    @NSManaged var dueDate: NSDate
    @NSManaged var motoImage: NSData
    @NSManaged var marque: String
    @NSManaged var model: String
    @NSManaged var kilometre: String
    @NSManaged var annee: String
    @NSManaged var identifier: String
    @NSManaged var service: NSSet
    @NSManaged var pneu: NSSet

}
