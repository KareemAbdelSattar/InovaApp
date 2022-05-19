//
//  UIImageView + Ext.swift
//  InovaApp
//
//  Created by kareem chetoos on 19/05/2022.
//

import Kingfisher
import UIKit

extension UIImageView {
    
    /// This function download images from url
    /// - url: Take image url
    func downloadImageWith(urlString: String) {
        let url = URL(string: urlString)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url, options: [
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .loadDiskFileSynchronously,
            .cacheOriginalImage
        ])
    }
}
