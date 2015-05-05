//
//  ContactsTableViewController.swift
//  ContactU
//
//  Created by Training on 21/07/14.
//  Copyright (c) 2014 Training. All rights reserved.
//

import UIKit
import CoreData

protocol ContactSelectionDelegate{
    func userDidSelectContact(contactIdentifier:NSString)
}


class ContactsTableViewController: UITableViewController {

    var yourContacts:NSMutableArray = NSMutableArray()
    var delegate:ContactSelectionDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }
    
    func loadData(){
    
               }
        
    
        
        
    }
    


    // #pragma mark - Table view data source

   func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

     func tableView(tableView: (UITableView!), numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
       // return yourContacts.count
        return 1
    }




    




