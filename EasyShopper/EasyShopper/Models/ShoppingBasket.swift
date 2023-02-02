//
//  ShoppingBasket.swift
//  EasyShopper
//
//  Created by Morten Bek Ditlevsen on 11/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation
import Algorithms

class ShoppingBasket: ObservableObject {
    @Published var contents: [Product] = []

    var totalPrice: Int {
        contents.reduce(into: 0) {
            $0 += $1.retailPrice
        }
    }

    func groupContentsByQuantity() -> [ShoppingBasketItem] {
        /// Container for the output array.
        var output: [ShoppingBasketItem] = []

        /// Get all unique types of `Products` in the basket.
        let productTypes: [Product] = Array(contents.uniqued())

        /// For each type, `count` how many are in the basket.
        for productType in productTypes {
            let count = self.contents.count(matching: productType)
            /// Use that `Product` and `count` to construct a `ShoppingBasketItem`.
            let item = ShoppingBasketItem(product: productType, quantity: count)
            /// Add that to the output array.
            output.append(item)
        }

        /// Return the array of `ShoppingBasketItem`s.
        return output
    }
}

extension Array where Element == Product {
    func count(matching product: Product) -> Int {
        self
            .filter { p in
                p == product
            }
            .count
    }
}

extension Array where Element == ShoppingBasketItem {
    func grandTotalRetailPrice() -> Int {
        self.reduce(into: 0) { partialResult, item in
            partialResult += item.totalRetailPrice
        }
    }
}
