//
//  PLPresenter.swift
//  VIPER
//
//  Created by ABA IT on 1/23/18.
//  Copyright © 2018 ABA IT. All rights reserved.
//

import Foundation

class PLPresenter : PLPresenterProtocol {
    
    weak var view: PLViewProtocol?
    
    var interactor: PLInteractorInputProtocol?
    
    var wireFrame: PLWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrievePostList()
    }
    
    func showPostDetail(forPost post: PostModel) {
        wireFrame?.presentPostDetailScreen(from: view! , forPost: post)
    }
    
}

extension PLPresenter : PLInteractorOutputProtocol {
    
    func didRetrievePosts(_ posts: [PostModel]) {
        view?.hideLoading()
        view?.showPosts(posts)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}







