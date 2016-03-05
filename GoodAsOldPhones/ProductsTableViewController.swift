//
//  ProductsTableViewController.swift
//  GoodAsOldPhones
//
//  Created by Andrew Byrne on 3/4/16.
//  Copyright © 2016 Andrew Byrne. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    var productNames: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set our array to have 4 values
        productNames = ["1907 Wall Set", "1921 Dial Phone", "1937 Desk Set", "1984 Motorola Portable"]
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Optional binding using 'if let' construct
        if let pNames = productNames {
            return pNames.count
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath)
        
        let productName = productNames?[indexPath.row] // Set product name
        
        if let pName = productName {
            cell.textLabel?.text = pName
        }
        
        cell.imageView?.image = UIImage(named: "image-cell1")
        return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowProduct" {
            let productVC = segue.destinationViewController as? ProductViewController
            productVC?.productName = "Really old phone"
        }
    }
    
}
