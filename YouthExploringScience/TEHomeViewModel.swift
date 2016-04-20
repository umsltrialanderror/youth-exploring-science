//
//  TEHomeViewModel.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/3/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import Foundation
import UIKit

protocol TEHomeDelegate : class {
    
    func home(home: TEHomeViewModel, didSelectUrl url: String);
}

class TEHomeViewModel {
    
    weak var delegate: TEHomeDelegate?
    
    func ActionClicked(index: Int){
        
        var url: String!
        switch (index){
        case 0:  //open students url
            
            url = "http:/www.google.org/";
            
        case 1: //open partners url
            
            url = "http://wwww.youthexploringscience.com/partners";
            
        case 2: //open yes website url
            
            url = "http://www.youthexploringscience.com/";
            
        case 3: //open slsc website url
            
            url = "http://www.slsc.org/";
            
        case 4: //open paylocity url
            
            url = "https://login.paylocity.com/Escher/Escher_WebUI/views/login/login.aspx";
            
        default: //open YES
            
            url = "http://www.youthexploringscience.com/"
            
            break;
        }
        
        delegate?.home(self, didSelectUrl: url)
    }
}