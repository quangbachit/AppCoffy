//
//  DataService.swift
//  Coffy
//
//  Created by Quang Bach on 4/4/17.
//  Copyright © 2017 QuangBach. All rights reserved.
//

import Foundation

struct StoreService {
    
    var id: Int
    var name: String
    var address: String
    var octime: String
    var rate: Double
    var lat: Double
    var long: Double
    var type: String
    var district: String
    
    init?(result: JSONDictionary){
        
        self.id = result["id"] as! Int
        self.name = result["name"] as! String
        self.address = result["address"] as! String
        self.octime = result["octime"] as! String
        self.rate = result["rate"] as! Double
        self.lat = result["lat"] as! Double
        self.long = result["long"] as! Double
        self.type = result["type"] as! String
        self.district = result["district"] as! String
    }
}
