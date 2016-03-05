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
    
    var productName: String? // Optional string - Any data that we don't know until the app runs, has to be marked as optional.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productNameLabel.text = productName 
        productImageView.image  = UIImage(named: "phone-fullscreen3")
    }
    
    @IBAction func addToCartPressed(sender: AnyObject) {
        print("Button tapped")
    }

}
