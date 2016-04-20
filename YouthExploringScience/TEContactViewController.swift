//
//  TEContactViewController.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/1/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import UIKit

class TEContactViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var contactCollectionView: UICollectionView!
    
    private var contacts : TEContacts!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //initialize contacts
        contacts = TEContacts();
        
        contactCollectionView.delegate = self;
        contactCollectionView.dataSource = self;
        
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.barTintColor = yes_red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Collection View Data Source Methods
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return contacts.getContactCount();
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        let contact = contacts.getContactAtIndex(indexPath.row); //grab the contact at the index
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("TEContactCollectionCell", forIndexPath: indexPath) as! TEContactCollectionViewCell
        
        cell.nameLabel.text = contact.first_name! + " " + contact.last_name!
        cell.portraitView.image = contact.portrait;
        
        return cell;
    }
    
    //MARK: Collection View Data Methods
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        //memoryGame.selectCardAtIndex(indexPath.row)
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        
//        let maxWidth = collectionView.bounds.size.width
//        let maxHeight = collectionView.bounds.size.height
//        let maxCardPerRow = 2
//        
//        let width = CGFloat(maxWidth / CGFloat(maxCardPerRow)) //we want two wide
//        let height = CGFloat(maxHeight / CGFloat(8)) //we want 8 rows
//        
//        return CGSizeMake(width, height)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
