//
//  ProductsTableViewController.swift
//  GoodAsOldPhones
//
//  Created by Andrew Byrne on 3/4/16.
//  Copyright © 2016 Andrew Byrne. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    var products: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let product1 = Product()
        let product2 = Product()
        let product3 = Product()
        let product4 = Product()
        
        
        product1.name = "1907 Wall Set"
        product1.productImage = "phone-fullscreen1"
        product1.cellImage = "image-cell1"
        product1.price = 59.99
        
        product2.name = "1921 Dial Phone"
        product2.productImage = "phone-fullscreen2"
        product2.cellImage = "image-cell2"
        product2.price = 39.99
        
        product3.name = "1937 Desk Set"
        product3.productImage = "phone-fullscreen3"
        product3.cellImage = "image-cell3"
        product3.price = 8.75
        
        product4.name = "1984 Motorola Portable"
        product4.productImage = "phone-fullscreen4"
        product4.cellImage = "image-cell4"
        product4.price = 127.44
        
        // Set our array to have 4 values
        products = [product1, product2, product3, product4]
        
        let ordersInCart = Orders.readOrdersFromArchive()
        updateCartBadge(ordersInCart.count)
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Optional binding using 'if let' construct
        if let p = products {
            return p.count
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath)
        
        let product = products?[indexPath.row] // Set product name
        
        if let p = product {
            cell.textLabel?.text = p.name
            if let i = p.cellImage {
                cell.imageView?.image = UIImage(named: i)
            }
            
        }
        
        
        return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowProduct" {
            let productVC = segue.destinationViewController as? ProductViewController
            
            // guard checks to make sure these values exist and if they do it sets them to the cell and indexPath variables => if you get past this guard, you can safely use these variablles.
            guard let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPathForCell(cell) else {
                    return
            }
            
            // use the index path to get the product name
            productVC?.product = products?[indexPath.row]
        }
    }
    
    func updateCartBadge(count: Int) {
        
        let tabItem = self.tabBarController?.tabBar.items![2]
        
        if (count > 0) {
            tabItem?.badgeValue = "\(count)"
        }
        else {
            tabItem?.badgeValue = nil
        }
    }

    
    
}
