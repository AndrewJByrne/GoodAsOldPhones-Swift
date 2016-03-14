//
//  Order.swift
//  GoodAsOldPhones
//
//  Created by Andrew Byrne on 3/5/16.
//  Copyright © 2016 Andrew Byrne. All rights reserved.
//

import UIKit

class Order: NSObject, NSCoding {
    let productName: String
    let productPrice: Double
    
    init(productName: String, productPrice: Double)  {
        
        self.productName = productName
        self.productPrice = productPrice
        super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.productName = aDecoder.decodeObjectForKey("name") as! String
        self.productPrice = aDecoder.decodeObjectForKey("price") as! Double
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(productName, forKey: "name")
        aCoder.encodeObject(productPrice, forKey: "price")
    }
    
    
    /*
    Version of initializer that can throw based on invalid initial property values.
    I am not using this, because the callee would have to by wrapped in a try. Not sure if
    this is the right thing to do at the moment.
    
    enum OrderErrorsList: ErrorType {
    case InvalidNewPropValue
    }
    
    
    init(productName: String, productPrice: Double) throws {
    
    self.productName = productName
    self.productPrice = productPrice
    super.init()
    
    
    guard self.productName.characters.count > 0 else {
    throw OrderErrorsList.InvalidNewPropValue
    }
    
    guard self.productPrice > 0.0 else {
    throw OrderErrorsList.InvalidNewPropValue
    }
    
    
    }
    
    */

}
