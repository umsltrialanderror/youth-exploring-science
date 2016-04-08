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
    
    //MARK: Table View Data Source Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return calendar.getEventCount();
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let event = calendar.getEventAtIndex(indexPath.row);
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CalendarCell")! as UITableViewCell
        cell.textLabel?.text = event.description;
        
        return cell;
    }
    
    //MARK: Calendar View Model Delegate Methods
    func receivedDataForEvents(){
        
        calendarTableView.reloadData()
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
