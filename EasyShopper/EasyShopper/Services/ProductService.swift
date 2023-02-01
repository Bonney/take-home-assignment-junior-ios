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
@MainActor class ProductService: ObservableObject {
    /// Use of `private(set)` ensures only this class update this array.
    @Published public private(set) var products: [Product] = []

    /// Error message for the UI.
    @Published public private(set) var error: Error? = nil

    init() {
        Task {
            await loadProducts()
        }
    }

    private func loadProducts() async {
        let networkRequestResult = await NetworkService().data(for: ProductService.endpoint)

        switch networkRequestResult {
        case .success(let loadedData):

            let decodeResult = decodeProducts(from: loadedData)

            switch decodeResult {
            case .success(let products):
                self.products = products
            case .failure(let error):
                print(error)
                self.error = error
            }

        case .failure(let error):
            print(error)
            self.error = error
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

//Task {
//    let output = await NetworkService().data(for: NetworkService.endpoint)
//    switch output {
//    case .success(let success):
//        //                        print(String(data: success, encoding: .utf8) ?? "")
//
//        do {
//            let converted = try JSONService().decoder.decode(Products.self, from: success)
//
//            let mapped = converted.reduce(into: []) {
//                $0.append($1.value)
//            }
//
//            print(mapped)
//
//            products = mapped
//        } catch {
//            print("## 01 ##")
//            print(error)
//        }
//    case .failure(let failure):
//        print("## 02 ##")
//        print(failure)
//    }
//}
