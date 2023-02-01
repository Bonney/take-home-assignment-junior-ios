//
//  ProductService.swift
//  EasyShopper
//
//  Created by Matt Bonney on 2/1/23.
//  Copyright © 2023 Ka-ching. All rights reserved.
//

import Foundation

typealias Products = [String: Product]

/// A service responsible for fetching the products from the network.
class ProductService {

    func loadProducts() async -> Result<[Product], Error> {
        let networkRequestResult = await NetworkService().data(for: ProductService.endpoint)

        switch networkRequestResult {
        case .success(let loadedData):

            let decodeResult = decodeProducts(from: loadedData)

            switch decodeResult {
            case .success(let products):
                return .success(products)
            case .failure(let error):
                return .failure(error)
            }

        case .failure(let error):
            return .failure(error)
        }
    }

    private func decodeProducts(from data: Data) -> Result<[Product], Error> {
        do {
            /// Attempt to decode the `Products` dictionary.
            let loaded = try JSONService().decoder.decode(Products.self, from: data)

            /// Convert that to an array of `Product`s.
            let mapped = loaded.reduce(into: []) { (results, productDictionary) in
                results.append(productDictionary.value)
            }
            return .success(mapped)
        } catch (let error) {
            return .failure(error)
        }
    }
}

extension ProductService {
    /// Endpoint URL for this practice project.
    static let endpoint = URL(string: "https://run.mocky.io/v3/4e23865c-b464-4259-83a3-061aaee400ba")!
}
