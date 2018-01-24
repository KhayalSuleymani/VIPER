//
//  PLInteractor.swift
//  VIPER
//
//  Created by ABA IT on 1/23/18.
//  Copyright © 2018 ABA IT. All rights reserved.
//

import Foundation

class PLInteractor : PLInteractorInputProtocol {
    
    weak var presenter: PLInteractorOutputProtocol?
    var localDataManager: PLLocalDataManagerInputProtocol?
    var remoteDataManager: PLRemoteDataManagerInputProtocol?
    
    func retrievePostList() {
        
        do {
            
            if let postList = try localDataManager?.retrievePostList() {
                
                let postModelList = postList.map() {
                    return PostModel(id: Int($0.id), title: $0.title!, imageURL: $0.imageURL!, thumbImageURL: $0.thumbImageURL!)
                }
                
                if postModelList.isEmpty {
                    remoteDataManager?.retrievePostList()
                }else {
                    presenter?.didRetrievePosts(postModelList)
                }
                
            }else {
                remoteDataManager?.retrievePostList()
            }
            
        }catch {
            presenter?.didRetrievePosts([])
        }
        
    }
    
}

extension PLInteractor : PLRemoteDataManagerOutputProtocol {
    
    func onPostRetrieved(_ posts: [PostModel]) {
        presenter?.didRetrievePosts(posts)
        
        for postModel in posts {
            do {
                try localDataManager?.savePost(id: postModel.id!, title: postModel.title!, imageUrl: postModel.imageURL!, thumbImageUrl: postModel.thumbImageURL!)
            } catch  {
                
            }
        }
    }
    
    func onError() {
        presenter?.onError()
    }
    
}











