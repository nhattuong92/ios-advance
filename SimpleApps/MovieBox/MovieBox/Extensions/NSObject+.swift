//
//  NSObject+.swift
//  MovieBox
//
//  Created by Thomas Ngo on 28/7/21.
//  Copyright © 2021 Thomas Ngo. All rights reserved.
//

import Foundation

protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}
