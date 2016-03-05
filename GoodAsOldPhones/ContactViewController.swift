//
//  ContactViewController.swift
//  GoodAsOldPhones
//
//  Created by Andrew Byrne on 3/4/16.
//  Copyright © 2016 Andrew Byrne. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        scrollView.contentSize = CGSizeMake(375, 800)
    }
}
