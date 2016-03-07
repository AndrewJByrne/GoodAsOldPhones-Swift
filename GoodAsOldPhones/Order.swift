//
//  Order.swift
//  GoodAsOldPhones
//
//  Created by Andrew Byrne on 3/5/16.
//  Copyright © 2016 Andrew Byrne. All rights reserved.
//

import UIKit

class Order: NSObject, NSCoding {
    var productName: String?
    var productPrice: Double?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.productName = aDecoder.decodeObjectForKey("name") as? String
        self.productPrice = aDecoder.decodeObjectForKey("price") as? Double
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(productName, forKey: "name")
        aCoder.encodeObject(productPrice, forKey: "price")
    }


}
