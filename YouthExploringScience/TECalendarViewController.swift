//
//  TECalendarViewController.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/1/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import UIKit

class TECalendarViewController: UIViewController {

    let webView:UIWebView = UIWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height * 0.8))
    let url = NSURL(string: "https://calendar.google.com/calendar/embed?src=guido997%40gmail.com&ctz=America/Chicago")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = yes_red;
        webView.center.y = UIScreen.mainScreen().bounds.height / 2
        view.addSubview(webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
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
