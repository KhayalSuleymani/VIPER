//
//  PostModel.swift
//  VIPER
//
//  Created by ABA IT on 1/22/18.
//  Copyright © 2018 ABA IT. All rights reserved.
//

import Foundation
import ObjectMapper

struct PostModel {
    var id : Int?
    var title : String?
    var imageURL : String?
    var thumbImageURL : String?
}

extension PostModel : Mappable {
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.id <- map["id"]
        self.title <- map["title"]
        self.imageURL <- map["url"]
        self.thumbImageURL <- map["thumbUrl"]
    }
    
}







