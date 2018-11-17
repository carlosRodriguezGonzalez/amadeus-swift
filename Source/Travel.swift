//
//  Travel.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation

public class Travel{
    
    public let analytics:Analytics
    
    public init(client:Client){
        analytics = Analytics(client:client)
    }
}
