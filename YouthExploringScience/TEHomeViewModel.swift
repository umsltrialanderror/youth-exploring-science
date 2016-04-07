//
//  TEHomeViewModel.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/3/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import Foundation
import UIKit

class TEHomeViewModel {
    
    func ActionClicked(index: Int){
        
        switch (index){
        case 0:  //open students url
            if let url = NSURL(string: "http://www.google.org/") {
                UIApplication.sharedApplication().openURL(url)
            }
            
        case 1: //open partners url
            if let url = NSURL(string: "http://www.youthexploringscience.com/partners") {
                UIApplication.sharedApplication().openURL(url)
            }
            
        case 2: //open yes website url
            if let url = NSURL(string: "http://www.youthexploringscience.com/") {
                UIApplication.sharedApplication().openURL(url)
            }
            
        case 3: //open slsc website url
            if let url = NSURL(string: "http://www.slsc.org/") {
                UIApplication.sharedApplication().openURL(url)
            }
            
            
        case 4: //open paylocity url
            if let url = NSURL(string: "https://login.paylocity.com/Escher/Escher_WebUI/views/login/login.aspx") {
                UIApplication.sharedApplication().openURL(url)
            }
            
        default: break;
        }
    }
}