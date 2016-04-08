//
//  ViewController.swift
//  YouthExploringScience
//
//  Created by Tony on 3/23/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import UIKit

class TEHomeViewController: UIViewController, TEHomeDelegate {

    var titleView: UIImageView!
    var homeModel : TEHomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeModel = TEHomeViewModel()
        homeModel.delegate = self
        
        let image = UIImage(named: "yes_nav_logo");
        titleView = UIImageView(image: image);
        self.navigationItem.titleView = titleView;

    }
    
    @IBAction func mainButtonClicked(sender: AnyObject) {
        
        homeModel.ActionClicked(sender.tag)
    }
    
    func home(home: TEHomeViewModel, didChangeUrl url: String) {
        
        if let url = NSURL(string: url) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
//    @IBAction func paylocityButtonClicked(sender: AnyObject) {
//        if let url = NSURL(string: "https://login.paylocity.com/Escher/Escher_WebUI/views/login/login.aspx") {
//            UIApplication.sharedApplication().openURL(url)
//        }
//    }
//    
//    @IBAction func slscButtonClicked(sender: AnyObject) {
//        if let url = NSURL(string: "http://www.slsc.org/") {
//            UIApplication.sharedApplication().openURL(url)
//        }
//    }

    
    
    //MARK: Memory Management Methods
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

