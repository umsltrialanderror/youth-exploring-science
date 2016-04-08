//
//  TEContacts.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/7/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import Foundation
import UIKit

class TEContacts: NSObject {
    
    private var contacts: NSMutableArray! //container to hold all of the contacts
    
    override init(){
        super.init();
        
        contacts = NSMutableArray(); //initialize container
        
        addFakeContacts();
    }
    
    private func addFakeContacts(){
        let c1 = TEContactModel();
        c1.first_name = "Bradley";
        c1.last_name = "Uding";
        c1.portrait = UIImage(named: "avatar5")
        addContact(c1);
        
        let c2 = TEContactModel();
        c2.first_name = "Dan";
        c2.last_name = "Drapp";
        c2.portrait = UIImage(named: "avatar5");
        addContact(c2);
        
        let c3 = TEContactModel();
        c3.first_name = "Tony";
        c3.last_name = "Cavallo";
        c3.portrait = UIImage(named: "avatar");
        addContact(c3);
        
        let c4 = TEContactModel();
        c4.first_name = "Alex"
        c4.last_name = "???"
        c4.portrait = UIImage(named: "avatar1");
        addContact(c4)
        
        let c5 = TEContactModel()
        c5.first_name = "Richard"
        c5.last_name = "???"
        c5.portrait = UIImage(named: "avatar3");
        addContact(c5)
    }
    
    func addContact(contact: TEContactModel) -> Bool{
        
        //checking to first ensure that the contact is not already in the list
        if(!contacts.containsObject(contact)){
            contacts.addObject(contact);
            return true;
        }
        
        //unable to add contact
        return false;
    }
    
    //simply returns the contact count
    func getContactCount()->Int{
        
        return contacts.count;
    }
    
    //returns the contact at a specific index
    func getContactAtIndex(index: Int)->TEContactModel{
        
        return contacts.objectAtIndex(index) as! TEContactModel;
    }
}