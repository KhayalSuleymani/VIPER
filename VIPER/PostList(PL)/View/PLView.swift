//
//  PLView.swift
//  VIPER
//
//  Created by ABA IT on 1/23/18.
//  Copyright © 2018 ABA IT. All rights reserved.
//

import UIKit
import PKHUD

fileprivate let CELL_IDENTIFIER = "PLCell"

class PLView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter : PLPresenterProtocol?
    var postList : [PostModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}


extension PLView : PLViewProtocol {
    
    func showPosts(_ posts: [PostModel]) {
        self.postList = posts
        tableView.reloadData()
    }
    
    func showError() {
        HUD.flash(.label("Check internet connection"), delay: 2.0)
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
}

extension PLView : UITableViewDelegate , UITableViewDataSource {
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postList.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let plCell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for:  indexPath) as? PLCell {
            plCell.set(forPost: postList[indexPath.row])
            return plCell
        }

        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}








