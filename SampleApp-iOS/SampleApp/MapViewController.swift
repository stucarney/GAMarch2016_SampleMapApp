//
//  MapViewController.swift
//  SampleApp
//
//  Created by Stu Carney on 3/24/16.
//  Copyright © 2016 Stu Carney. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var location = "Austin, TX"  // Placeholder
    
    // MARK: - UIViewController Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = location
        
        geocodeLocationAndUpdateMap()
    }
    
    // MARK: - Private Methods
    
    private func geocodeLocationAndUpdateMap() {
        // Core Location Framework
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (coreLocationPlacemarks, error) in
            if let placemarks = coreLocationPlacemarks where placemarks.count > 0 {
                let topCoreLocationPlacemark = placemarks[0]
                
                self.updateMapViewWithCLPlacemark(topCoreLocationPlacemark)
            }
        }
    }
    
    private func updateMapViewWithCLPlacemark(coreLocationPlacemark: CLPlacemark) {
        // MapKit Framework, covering to a placemark that conforms to MKAnnotation, for the map
        let centerCoordinate = coreLocationPlacemark.location!.coordinate
        let desiredSquareRegion = MKCoordinateRegionMakeWithDistance(centerCoordinate, 50000, 50000)
        let adjustedRegionForView = mapView.regionThatFits(desiredSquareRegion)
        
        // Update Map View
        mapView.setRegion(adjustedRegionForView, animated: true)
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
