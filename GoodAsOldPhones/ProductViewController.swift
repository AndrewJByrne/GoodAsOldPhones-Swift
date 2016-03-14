//
//  ProductViewController.swift
//  GoodAsOldPhones
//
//  Created by Andrew Byrne on 3/4/16.
//  Copyright © 2016 Andrew Byrne. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    var product: Product? // Optional string - Any data that we don't know until the app runs, has to be marked as optional.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let p = product {
            productNameLabel.text = p.name
            if let i = p.productImage {
                productImageView.image  = UIImage(named: i)
            }
            
        }
        
    }
    
    @IBAction func addToCartPressed(sender: AnyObject) {
        
        guard let product = product, let name = product.name, let price = product.price else {
            return
        }
        
        // create an order
        let order = Order()
        order.productName = name
        order.productPrice = price
        
        var ordersInCart = Orders.readOrdersFromArchive()
        ordersInCart.append(order)
        
        // save this order to disk
        let success = Orders.saveOrdersToArchive(ordersInCart)
        var alertController: UIAlertController
        if(success) {
            alertController = UIAlertController(title: "Added to Cart", message: "You added \(name) to the cart and it costs \(price)", preferredStyle: UIAlertControllerStyle.Alert)
        
            updateCartBadge(ordersInCart.count)
            
        }
        else {
            alertController = UIAlertController(title: "Error", message: "Failed to add \(name) to the cart", preferredStyle: UIAlertControllerStyle.Alert)
        }
        
        // The Default action style will dismiss the alert
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        presentViewController(alertController, animated: true, completion: nil)
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
