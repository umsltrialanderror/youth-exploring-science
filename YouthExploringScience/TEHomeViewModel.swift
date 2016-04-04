//
//  TEHomeViewModel.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/3/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import Foundation

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
            break;
            
        case 4: print("Paylocity Clicked.") //open paylocity url
            break;
            
        default: break;
        }
    }
}