//
//  ViewController.swift
//  Example
//
//  Created by Charly Maxter on 04/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import UIKit
import Amadeus

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let amadeus = Amadeus(client_id: "123", client_secret: "234")
        
        //amadeus.auth.testAuth()
        
        amadeus.client.getAccessToken(onCompletion: {
            access_token in
            print("access:",access_token)
        })
        
        
    }


}

