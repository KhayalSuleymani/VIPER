//
//  PLWireFrame.swift
//  VIPER
//
//  Created by ABA IT on 1/23/18.
//  Copyright © 2018 ABA IT. All rights reserved.
//

import Foundation
import UIKit

class PLWireFrame : PLWireFrameProtocol {
    
    static var mainStoryboard : UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createPostListModule() -> UIViewController {
        
        if let navVC = mainStoryboard.instantiateViewController(withIdentifier: "PostsNavigationController") as? UINavigationController {
        
            if let view = navVC.childViewControllers.first as? PLView {
                
                let presenter : PLPresenterProtocol & PLInteractorOutputProtocol = PLPresenter()
                let interactor : PLInteractorInputProtocol & PLRemoteDataManagerOutputProtocol = PLInteractor()
                let localDataManager : PLLocalDataManagerInputProtocol = PLLocalDataManager()
                let remoteDataManager : PLRemoteDataManagerInputProtocol = PLRemoteDataManager()
                let wireFrame : PLWireFrameProtocol = PLWireFrame()
                
                view.presenter = presenter
                presenter.view = view
                presenter.interactor = interactor
                presenter.wireFrame = wireFrame
                interactor.presenter = presenter
                interactor.localDataManager = localDataManager
                interactor.remoteDataManager = remoteDataManager
                remoteDataManager.remoteRequestHandler = interactor
                
                return navVC
            }
            
        }
        
       return UIViewController()
    }
    
    func presentPostDetailScreen(from view: PLViewProtocol, forPost post: PostModel) {
        
    }
    
}








