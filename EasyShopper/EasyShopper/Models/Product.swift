//
//  Product.swift
//  EasyShopper
//
//  Created by Morten Bek Ditlevsen on 11/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation

struct Product: Decodable {
    let barcode: String
    let description: String?
    let id: String?
    let imageURL: String?
    let name: String?
    let retailPrice: Int
    let costPrice: Int?
}

/// Identifiable conformance comes "for free" because `Products` have `.id`s.
extension Product: Identifiable {
}


