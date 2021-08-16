//
//  MovieResponseDate.swift
//  MovieBox
//
//  Created by Thomas Ngo on 28/7/21.
//  Copyright © 2021 Thomas Ngo. All rights reserved.
//

import Foundation

struct MovieResponseDate: Codable, Equatable {
    let maximum: Date?
    let minimum: Date?
}
