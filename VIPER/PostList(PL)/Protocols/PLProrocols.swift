//
//  PLProrocols.swift
//  VIPER
//
//  Created by ABA IT on 1/23/18.
//  Copyright © 2018 ABA IT. All rights reserved.
//

import Foundation
import UIKit

protocol PLLocalDataManagerInputProtocol : class {
    // INTERACTOR ---> LOCAL DATA MANAGER
    func retrievePostList () throws -> [Post]
    func savePost (id : Int , title : String , imageUrl : String , thumbImageUrl : String) throws
}

protocol PLRemoteDataManagerInputProtocol : class {
    var remoteRequestHandler : PLRemoteDataManagerOutputProtocol? { get set }
    func retrievePostList()
}

protocol PLRemoteDataManagerOutputProtocol : class {
    func onPostRetrieved ( _ posts : [PostModel] )
    func onError ()
}

protocol PLInteractorInputProtocol : class {
    var presenter : PLInteractorOutputProtocol? { get set }
    var localDataManager : PLLocalDataManagerInputProtocol? { get set }
    var remoteDataManager : PLRemoteDataManagerInputProtocol? { get set }
    // PRESENTER -> INTERACTOR
    func retrievePostList()
}

protocol PLInteractorOutputProtocol : class {
    // INTERACTOR -> PRESENTER
    func didRetrievePosts ( _ posts : [PostModel])
    func onError ()
}

protocol PLPresenterProtocol : class {
    var view : PLViewProtocol? { get set }
    var interactor : PLInteractorInputProtocol? { get set }
    var wireFrame : PLWireFrameProtocol? { get set }
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showPostDetail (forPost post : PostModel)
}

protocol PLViewProtocol  : class {
    var presenter : PLPresenterProtocol? { get set }
    // PRESENT --- VIEW
    func showPosts ( _ posts : [PostModel])
    func showError ()
    func showLoading ()
    func hideLoading ()
}

protocol PLWireFrameProtocol : class {
    static func createPostListModule () -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentPostDetailScreen (from view : PLViewProtocol , forPost post : PostModel)
}




























