//
//  CartTableViewController.swift
//  GoodAsOldPhones
//
//  Created by Andrew Byrne on 3/5/16.
//  Copyright © 2016 Andrew Byrne. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {

    @IBAction func emptyCart(sender: AnyObject) {
        // Confirm
        let alertController = UIAlertController(title: "Empty Cart?", message: "Are you sure you want to empty the cart?", preferredStyle: UIAlertControllerStyle.Alert)
        
        
        // Use the Destructive style for the empty action
        alertController.addAction(UIAlertAction(title: "Empty", style: UIAlertActionStyle.Destructive, handler: { action in self.removeAllFromCart() }))
        
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
        presentViewController(alertController, animated: true, completion: nil)
        
    
    }
    
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    var ordersInCart: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableHeaderView = headerView

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        ordersInCart = Orders.readOrdersFromArchive()
        tableView.reloadData()
        updateTotal()
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersInCart.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CartCell", forIndexPath: indexPath)

        let order = ordersInCart[indexPath.row]
        
        cell.textLabel?.text = order.productName ?? "unknown"
        cell.detailTextLabel?.text   = String(order.productPrice) ?? "unknown"

        return cell
    }


       // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            // Confirm
            let alertController = UIAlertController(title: "Confirm Deletion", message: "Are you sure you want to delete this item?", preferredStyle: UIAlertControllerStyle.Alert)
            
            
            // Use the Destructive style for the empty action
            alertController.addAction(UIAlertAction(title: "Delete", style: UIAlertActionStyle.Destructive, handler: { action in self.deleteFromCart(indexPath) }))
            
            
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: {action in self.cancelEditing()}))
            
            presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        
    }
    
    func updateTotal() {
        var total: Double = 0.0
        for order in ordersInCart {
            if let price = order.productPrice {
                total = total + price
            }
        }
        totalLabel.text = String(total)
    }
    
    func removeAllFromCart() {
        ordersInCart.removeAll()
        Orders.saveOrdersToArchive(ordersInCart)
        updateTotal()
        tableView.reloadData()
    }
    
    func deleteFromCart(indexPath: NSIndexPath) {
        
        // Delete the row from the data source
        ordersInCart.removeAtIndex(indexPath.row)
        
        // save array back to disk
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
        Orders.saveOrdersToArchive(ordersInCart)
        updateTotal()
        tableView.reloadData()
        
    }
    
    func cancelEditing() {
        tableView.setEditing(false, animated: true)
    }
    
}
