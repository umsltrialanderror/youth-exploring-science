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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "yes_nav_logo");
        titleView = UIImageView(image: image);
        
        //        theImageView.image = theImageView.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
//        theImageView.tintColor = UIColor.redColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated);
        
//        titleView.bounds = (self.navigationController?.navigationBar.bounds)!
        self.navigationItem.titleView = titleView;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

