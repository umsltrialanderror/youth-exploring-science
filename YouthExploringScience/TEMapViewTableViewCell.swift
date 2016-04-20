//
//  TEMapViewTableViewCell.swift
//  YouthExploringScience
//
//  Created by Bradley on 4/16/16.
//  Copyright © 2016 St. Louis Science Center. All rights reserved.
//

import UIKit
import MapKit

class TEMapViewTableViewCell: UITableViewCell, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let regionRadius: CLLocationDistance = 1000

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        mapView.delegate = self        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 3.0, regionRadius * 3.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func createGeocodeForAddress(address: String?, withTitle title: String?, withSubtitle subtitle: String?){
        
        let geoloc = CLGeocoder()
        
        geoloc.geocodeAddressString(address!, inRegion: nil, completionHandler: {(placemarks, error) in
            
            let topResult = placemarks![0]
            let placemark = MKPlacemark(placemark: topResult)
            
            let ann = MKPointAnnotation()
            ann.coordinate = placemark.coordinate
            
            if let t = title {
                ann.title = t;
            }
            if let s = subtitle{
                ann.subtitle = s
            }
            self.mapView.addAnnotation(ann)
            self.centerMapOnLocation(placemark.location!)
        })
    }
    
//    -(void) createGeocoderForContact:(BUContact*)contact withZoom:(BOOL) canZoom{
//    
//    for (BUAddress *address in contact.addresses){
//    
//    NSString *locationString = [address getLocation];
//    
//    CLGeocoder *geoloc = [[CLGeocoder alloc] init];
//    [geoloc geocodeAddressString:locationString completionHandler:^(NSArray *placemarks, NSError *error){
//    
//    if (placemarks && placemarks.count > 0){
//    
//    CLPlacemark *topResult = [placemarks objectAtIndex:0];
//    MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:topResult];
//    
//    if(canZoom)
//    [self zoomIntoLocation:placemark.location];
//    
//    MKPointAnnotation *ann = [[MKPointAnnotation alloc] init];
//    ann.coordinate = placemark.coordinate;
//    ann.title = [contact getFullName];
//    ann.subtitle = [address getShortLocation];
//    
//    [_mapView addAnnotation:ann];
//    }
//    }];
//    }
//    }
}
