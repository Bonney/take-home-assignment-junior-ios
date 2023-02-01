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
    /// The particular URL this service will interact with.
    private var endpoint: URL

    init(endpoint: URL) {
        self.endpoint = endpoint
    }
}

extension NetworkService {
    /// Return the `Data` from a given URL.
    func data(for url: URL) async -> Result<Data, Error> {
        do {
            /// Run the async URLSession request.
            let (data, _) = try await URLSession.shared.data(from: url)
            /// If we got data in the `try` request, return the data.
            return .success(data)
        } catch (let error) {
            /// Error case: something went wrong with the URLRequest.
            /// Log the error. In production, I'd use an `os.Logger` at the bare minimum.
            print("🌐 Error in NetworkService: \(error.localizedDescription)")
            /// Return a failure result with the error.
            return .failure(error)
        }
    }
}

extension NetworkService {
    /// Endpoint URL for this practice project.
    static let endpoint = URL(string: "https://run.mocky.io/v3/4e23865c-b464-4259-83a3-061aaee400ba")!
}
