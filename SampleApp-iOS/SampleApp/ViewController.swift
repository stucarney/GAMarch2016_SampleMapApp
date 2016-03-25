//
//  ViewController.swift
//  SampleApp
//
//  Created by Stu Carney on 3/24/16.
//  Copyright © 2016 Stu Carney. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cities = ["Austin, TX", "New Orleans, LA", "New York City, NY", "Raleigh, NC", "Las Vegas, NV", "Seattle, WA"]
    
    var selectedCity = ""
    
    // MARK: - UIViewController Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Cities"
    }
    
    // MARK: - UITableView DataSource Protocols
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("nameCell")!
        cell.textLabel!.text = cities[indexPath.row]
            
        return cell
    }
    
    // MARK: - UITableView Delegate Protocols
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedCity = cities[indexPath.row]
        
        self.performSegueWithIdentifier("showMap", sender: self)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMap" {
            if let mapVC = segue.destinationViewController as? MapViewController {
                mapVC.location = selectedCity
            }            
        }
    }
}

