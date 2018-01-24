//
//  PLRemoteDataManager.swift
//  VIPER
//
//  Created by ABA IT on 1/23/18.
//  Copyright © 2018 ABA IT. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class PLRemoteDataManager : PLRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: PLRemoteDataManagerOutputProtocol?
    
    func retrievePostList() {
    
        Alamofire
            .request(Endpoints.Posts.fetch.url , method : .get)
            .validate()
            .responseArray { (response : DataResponse<[PostModel]>) in
                
                switch response.result {
                case .success( let posts ):
                    self.remoteRequestHandler?.onPostRetrieved(posts)
                case .failure(_):
                    self.remoteRequestHandler?.onError()
                }
                
        }
        
    }
    
}






