//
//  NetworkService.swift
//  EasyShopper
//
//  Created by Matt Bonney on 2/1/23.
//  Copyright © 2023 Ka-ching. All rights reserved.
//

import Swift
import Foundation

/// A service responsible for network activity.
class NetworkService {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
}

extension NetworkService {
    /// Return the `Data` from a given URL.
    func data(for url: URL) async -> Result<Data, Error> {
        do {
            /// Run the async URLSession request.
            let (data, _) = try await self.urlSession.data(from: url)
            /// If we got data in the `try` request, return the data.
            return .success(data)
        } catch (let error) {
            /// Error case: something went wrong with the URLRequest.
            /// Log the error. In production, I'd use an `os.Logger` at the bare minimum.
            print("🌐 Error in NetworkService.")
            print(error)
            /// Return a failure result with the error.
            return .failure(error)
        }
    }
}
