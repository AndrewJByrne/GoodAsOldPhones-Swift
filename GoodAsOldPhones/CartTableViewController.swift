//
//  CartTableViewController.swift
//  GoodAsOldPhones
//
//  Created by Andrew Byrne on 3/5/16.
//  Copyright © 2016 Andrew Byrne. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    var ordersInCart: [Order]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableHeaderView = headerView

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        ordersInCart = Orders.readOrdersFromArchive()
        if(ordersInCart == nil) {
            ordersInCart = []
        }
        
        tableView.reloadData()
        
        updateTotal()
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Nil-coalescing operator (??) removes need for if let syntax
        return ordersInCart?.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CartCell", forIndexPath: indexPath)

        let order = ordersInCart?[indexPath.row]
        
        if let order = order {
            cell.textLabel?.text = order.product?.name
            cell.detailTextLabel?.text   = String(order.product?.price)
        }

        return cell
    }


       // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            ordersInCart?.removeAtIndex(indexPath.row)
            // save array back to disk
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
        updateTotal()   
    }
    
    func updateTotal() {
        if let orders = ordersInCart {
            var total: Double = 0.0
            for order in orders {
                if let price = order.product?.price {
                    total = total + price
                }
            }
            totalLabel.text = String(total)
        }
    }
    
}
