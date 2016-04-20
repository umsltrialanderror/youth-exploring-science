//
//  TECalendarViewController.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/1/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import UIKit

class TECalendarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CalendarViewModelDelegate {

    @IBOutlet weak var calendarTableView: UITableView!
    private var calendar: TECalendarViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = yes_red;
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.navigationController?.navigationBar.translucent = false
        calendarTableView.delegate = self;
        calendarTableView.dataSource = self;
        
        calendar = TECalendarViewModel(delegate: self);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        calendar.getWebDataForEvents()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return calendar.getSeperateDateCounts();
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        view.tintColor = yes_red
        view.tintColor = UIColor(colorLiteralRed: 207.0/255, green: 67.0/255, blue: 52.0/255, alpha: 0.5);
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.whiteColor();
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return calendar.getDateTitleAtIndex(section);
    }
    
    //MARK: Table View Data Source Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return calendar.getEventCount();
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let event = calendar.getEventAtIndex(indexPath.row);
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CalendarCell")! as UITableViewCell
        cell.textLabel?.text = event.summary;
        
        return cell;
    }
    
    //MARK: Calendar View Model Delegate Methods
    func receivedDataForEvents(){
        
        calendarTableView.reloadData()
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vc = segue.destinationViewController as! TECalendarEventViewController
        vc.navigationController?.navigationItem.title = "Hello";
        
        if let indexPath = self.calendarTableView.indexPathForSelectedRow {
            
        }
    }

}
