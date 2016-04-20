//
//  TECalendarEventViewController.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/11/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import UIKit

class TECalendarEventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var eventTableView: UITableView!
    
    var model = TECalendarEventModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        //setting up delegates and datasources
        eventTableView.delegate = self;
        eventTableView.dataSource = self;

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationItem.title = model.calendarEvent.summary
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Table View Data Source Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if(section == 1){
            return 2
        }
        
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        
        return model.GetSectionCount()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if(indexPath.section == 2){
            
            return 150
        }
        
        return UITableViewAutomaticDimension        
    }
 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let event = model.calendarEvent
        let start : GTLDateTime! = event.start.dateTime ?? event.start.date
        let end : GTLDateTime! = event.end.dateTime ?? event.end.date
        let startString = NSDateFormatter.localizedStringFromDate(start.date, dateStyle: .NoStyle, timeStyle: .ShortStyle)
        let endString = NSDateFormatter.localizedStringFromDate(end.date, dateStyle: .NoStyle, timeStyle: .ShortStyle)
        
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCellWithIdentifier("DescriptionCell") as! TEEventDescriptionTableViewCell!
            cell.descriptionLabel.text = model.calendarEvent.descriptionProperty
            return cell
        }
        else if (indexPath.section == 1){
            
            if(indexPath.row == 0){
                let cell = tableView.dequeueReusableCellWithIdentifier("TimeCell") as! TEEventTimeTableViewCell
                cell.timeLabel.text = "Start: @\(startString)"
                return cell
            }
            else{
                let cell = tableView.dequeueReusableCellWithIdentifier("TimeCell") as! TEEventTimeTableViewCell
                cell.timeLabel.text = "End: @\(endString)"
                return cell
            }
        }
        else if (indexPath.section == 2){
            
            let cell = tableView.dequeueReusableCellWithIdentifier("MapCell") as! TEMapViewTableViewCell
            
            if let loc = event.location{
                cell.createGeocodeForAddress(loc, withTitle: event.summary, withSubtitle: event.descriptionProperty)
            }
            return cell
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier("LinkCell") as! TEEventLinkTableViewCell!
        cell.htmlLink = event.htmlLink ?? ""
        
        return cell;
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        if(section == 2){
            
            return model.calendarEvent.location
        }
        
        return ""
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if(section == 0){
            return "WHAT"
        }
        
        if(section == 1){
            return "WHEN"
        }
        
        if(section == 2){
            return "WHERE"
        }
        
        return nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
