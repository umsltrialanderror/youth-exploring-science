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
        case 0: print("Students clicked.") //open students url
            break
            
        case 1: print("Partners Clicked.")//open partners url
            break;
            
        case 2: print("YES Website Clicked.") //open yes website url
            break;
            
        case 3: print("SLSC Website Clicked.") //open slsc website url
            if let url = NSURL(string: "http://www.slsc.org/") {
                UIApplication.sharedApplication().openURL(url)
            }
            
            
        case 4: print("Paylocity Clicked.") //open paylocity url
            if let url = NSURL(string: "https://login.paylocity.com/Escher/Escher_WebUI/views/login/login.aspx") {
                UIApplication.sharedApplication().openURL(url)
            }
            
        default: break;
        }
    }
}