//
//  ShoppingBasket.swift
//  EasyShopper
//
//  Created by Morten Bek Ditlevsen on 11/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation

class ShoppingBasket: ObservableObject {
    @Published var contents: [Product] = []

    var totalPrice: Int {
        contents.reduce(into: 0) {
            $0 += $1.retailPrice
        }
    }

}
