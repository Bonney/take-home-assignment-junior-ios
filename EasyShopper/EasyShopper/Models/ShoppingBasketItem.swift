//
//  ShoppingBasketItem.swift
//  EasyShopper
//
//  Created by Matt Bonney on 2/1/23.
//  Copyright © 2023 Ka-ching. All rights reserved.
//

import Foundation

struct ShoppingBasketItem {
    let product: Product
    var quantity: Int

    init(product: Product, quantity: Int = 1) {
        self.product = product
        self.quantity = quantity
    }
}
