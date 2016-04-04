//
//  ViewController.swift
//  YouthExploringScience
//
//  Created by Tony on 3/23/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import UIKit

class TEHomeViewController: UIViewController {

    var titleView: UIImageView!
    var homeModel : TEHomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeModel = TEHomeViewModel()
        
        let image = UIImage(named: "yes_nav_logo");
        titleView = UIImageView(image: image);
        self.navigationItem.titleView = titleView;

    }
    
    @IBAction func mainButtonClicked(sender: AnyObject) {
        
        homeModel.ActionClicked(sender.tag)
    }
    
    
    //MARK: Memory Management Methods
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

