//
//  Pneu.swift
//  
//
//  Created by Macmini_Dagon on 05.05.15.
//
//

import Foundation
import CoreData

class Pneu: NSManagedObject {

    @NSManaged var pneumarque: String
    @NSManaged var pneutype: String
    @NSManaged var pneureference: String
    @NSManaged var pneuprofil: String
    @NSManaged var identifier: String
    @NSManaged var moto: Moto

}
