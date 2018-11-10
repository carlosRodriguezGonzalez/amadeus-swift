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
    
    var amadeus: Amadeus!
    var btnClick: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        self.amadeus = Amadeus(client_id: "VAywvANdPdsxwP6NCA8eKikGdF57QUcF", client_secret: "GCAZRSicTFpR6xbU")
        
        //amadeus.auth.testAuth()
        
        amadeus.client.getAccessToken(onCompletion: {
            access_token in
            print("access:",access_token)
        })
        
        btnClick = UIButton()
        btnClick.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        btnClick.addTarget(self, action: #selector(press), for: .touchUpInside)
        btnClick.backgroundColor = .blue
        view.addSubview(btnClick)
    }

    @objc func press(){
        amadeus.client.getAccessToken(onCompletion: {
            access_token in
            print("access:",access_token)
        })

    }

}

