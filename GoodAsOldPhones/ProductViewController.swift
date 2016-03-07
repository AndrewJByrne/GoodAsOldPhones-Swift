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
        order.product = product;
        
        var ordersInCart = Orders.readOrdersFromArchive()
        if(ordersInCart == nil) {
            ordersInCart = []
        }
        
        ordersInCart?.append(order)
        
        // save this order to disk
        if let orders = ordersInCart {
            let success = Orders.saveOrdersToArchive(orders)
            if(success) {
                
            }
            
        }
        
        let alertController = UIAlertController(title: "Added to Cart", message: "You added \(name) to the cart and it costs \(price)", preferredStyle: UIAlertControllerStyle.Alert)
        
        // The Defautl actin style will dismiss the alert
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        presentViewController(alertController, animated: true, completion: nil)
    }

}
