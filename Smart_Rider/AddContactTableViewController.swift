//
//  AddContactTableViewController.swift
//  ContactU
//
//  Created by Training on 21/07/14.
//  Copyright (c) 2014 Training. All rights reserved.
//

import UIKit
import CoreData


class AddContactTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet var marqueTextField: UITextField!
    @IBOutlet var modelTextField: UITextField!
    @IBOutlet var anneeTextField: UITextField!
    @IBOutlet var kilometrageTextField: UITextField!
    @IBOutlet var motoImageView: UIImageView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGestureRecognizer:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "chooseImage:")
        tapGestureRecognizer.numberOfTapsRequired = 1
        
        motoImageView.addGestureRecognizer(tapGestureRecognizer)
        motoImageView.userInteractionEnabled = true
    
    
    }
    
    
    func chooseImage(recognizer:UITapGestureRecognizer){
        let imagePicker:UIImagePickerController = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        
        let pickedImage:UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage!
        
        // small picture
        let smallPicture = scaleImageWith(pickedImage, newSize: CGSizeMake(100, 100))
        
        
        var sizeOfImageView:CGRect = motoImageView.frame
        sizeOfImageView.size = smallPicture.size
        motoImageView.frame = sizeOfImageView
        
        motoImageView.image = smallPicture
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    

    func scaleImageWith(image:UIImage, newSize:CGSize)->UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    @IBAction func addContact(sender: AnyObject) {
        let moc:NSManagedObjectContext = SwiftCoreDataHelper.managedObjectContext()
        
        var moto:Moto = SwiftCoreDataHelper.insertManagedObject(NSStringFromClass(Moto), managedObjectConect: moc) as! Moto
        
        moto.identifier = "\(NSDate())"
        moto.marque = marqueTextField.text
        moto.model = modelTextField.text
        moto.annee = anneeTextField.text
        moto.kilometre = kilometrageTextField.text
        
        let motoImagedata:NSData = UIImagePNGRepresentation(motoImageView.image)
        
        moto.motoImage = motoImagedata
        
        //A ajouter éventuellement pour les sous-listes
        
      //  var toDoItem:ToDoItem = SwiftCoreDataHelper.insertManagedObject(NSStringFromClass(ToDoItem), managedObjectConect: moc) as! ToDoItem
        
      //  toDoItem.identifier = "\(NSDate())"
      //  toDoItem.dueDate = NSDate()
      //  toDoItem.note = ""
      //  toDoItem.contact = contact

        
        SwiftCoreDataHelper.saveManagedObjectContext(moc)
        
        self.navigationController!.popViewControllerAnimated(true)

        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
