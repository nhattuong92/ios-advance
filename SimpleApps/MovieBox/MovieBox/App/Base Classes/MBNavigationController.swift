//
//  MBNavigationController.swift
//  MovieBox
//
//  Created by Thomas Ngo on 31/7/21.
//  Copyright © 2021 Thomas Ngo. All rights reserved.
//

import UIKit

final class MBNavigationController: UINavigationController {
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        setUpController()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpController()
    }
    
    private func setUpController() {
        navigationBar.isTranslucent = false
        navigationBar.shadowImage = UIImage()
        navigationBar.barTintColor = UIColor(hex: 0x212121)
    }
}
