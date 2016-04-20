//
//  TECalendarEventListViewController.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/13/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import UIKit

class TECalendarEventListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TECalendarEventListDelegate {

    @IBOutlet weak var eventListTableView: UITableView!
    private var model = TECalendarEventListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.barTintColor = yes_red;
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.navigationController?.navigationBar.translucent = false
        
        model.fetchEvents()
        model.delegate = self
        eventListTableView.dataSource = self
        eventListTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Calendar Event List Delegate Methods
    func didFinishFetchingData(){
        
        eventListTableView.reloadData()
    }
    

    //MARK: Table View Datasource Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return model.GetEventsForSectionCount(section)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        
        return model.GetDateCount()
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     
        let date = model.GetStartDateAtIndex(section)
        
        let dateString = NSDateFormatter.localizedStringFromDate(date , dateStyle: .ShortStyle, timeStyle: .NoStyle)
        
        return "\(dateString)"        
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textAlignment = .Center
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell")! as! TEEventListTableViewCell
        
        //get event from model
        let event = model.GetEventAtSection(indexPath.section, andIndex: indexPath.row)
        
        let start : GTLDateTime! = event.start.dateTime ?? event.start.date
        let end : GTLDateTime! = event.end.dateTime ?? event.end.date
        let startString = NSDateFormatter.localizedStringFromDate(start.date, dateStyle: .NoStyle, timeStyle: .ShortStyle)
        let endString = NSDateFormatter.localizedStringFromDate(end.date, dateStyle: .NoStyle, timeStyle: .ShortStyle)
        
        cell.summaryLabel.text = event.summary
        cell.summaryLabel.textColor = yes_dark_red
        cell.timeLabel.text = "\(startString) - \(endString)"
        cell.locationLabel.text = event.location
        cell.calendarView.dayOfWeekString = "Mon"
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        let event = model.GetEventAtSection(indexPath.section, andIndex: indexPath.row)
        
        if let _ = event.location {
            
            return 100.0
        }
        else {
            
            return 80.0
        }
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let vc = segue.destinationViewController as! TECalendarEventViewController
        
        if let indexPath = self.eventListTableView.indexPathForSelectedRow{
            
            let event = model.GetEventAtSection(indexPath.section, andIndex: indexPath.row)
            vc.navigationController?.navigationItem.title = event.summary
            vc.model.calendarEvent = event
        }
    }
}
