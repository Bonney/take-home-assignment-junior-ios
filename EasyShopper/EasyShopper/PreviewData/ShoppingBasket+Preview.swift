//
//  ShoppingBasket+Preview.swift
//  EasyShopper
//
//  Created by Matt Bonney on 2/2/23.
//  Copyright © 2023 Ka-ching. All rights reserved.
//

import Foundation

extension ShoppingBasket {
    static var preview: ShoppingBasket = {
        let basket = ShoppingBasket()

        basket.contents = [
            Product.preview_01,
            Product.preview_02, Product.preview_02,
            Product.preview_03, Product.preview_03, Product.preview_03,
            Product.preview_04,
            Product.preview_05, Product.preview_05
        ]

        return basket
    }()
}
