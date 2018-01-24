//
//  EndPoints.swift
//  VIPER
//
//  Created by ABA IT on 1/22/18.
//  Copyright © 2018 ABA IT. All rights reserved.
//

import Foundation

struct API {
    static fileprivate var baseURL : String {
        get {
            return "https://fierce-cove-29863.herokuapp.com"
        }
    }
}

private protocol Endpoint {
    var url : String { get }
    var path : String { get }
}

enum Endpoints {

    enum Posts : Endpoint {
        
        case fetch
        
        public var url: String {
            switch self {
                case .fetch : return "\(API.baseURL)\(path)"
            }
        }
        
        public var path: String {
            switch self {
                case .fetch: return "/getAllPosts"
            }
        }
    }
}


















