//
//  PLCell.swift
//  VIPER
//
//  Created by ABA IT on 1/23/18.
//  Copyright © 2018 ABA IT. All rights reserved.
//

import UIKit
import AlamofireImage


class PLCell: UITableViewCell {

    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    func set (forPost post : PostModel ) {
        self.selectionStyle = .none
        titleLabel.text = post.title
        subtitleLabel.text = post.title
        let placeholderImage = UIImage(named : "placeholder")
        let url = URL(string : post.thumbImageURL!)!
        customImageView.af_setImage(withURL: url , placeholderImage : placeholderImage)
    }

}
