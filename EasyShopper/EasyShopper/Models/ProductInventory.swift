//
//  ProductInventory.swift
//  EasyShopper
//
//  Created by Matt Bonney on 2/1/23.
//  Copyright © 2023 Ka-ching. All rights reserved.
//

import Foundation

class ProductInventory: ObservableObject {
    /// Use of `private(set)` ensures only this class update this array.
    @Published public private(set) var products: [Product] = []

    /// Error message for the UI.
    @Published public private(set) var error: Error? = nil

    init() {
        Task {
            let loadingResult = await ProductService().loadProducts()

            switch loadingResult {
            case .success(let successfullyLoaded):
                DispatchQueue.main.async {
                    self.products = successfullyLoaded
                    print(self.products)
                }

            case .failure(let failure):
                print(failure)
                self.error = failure
            }
        }
    }
}
