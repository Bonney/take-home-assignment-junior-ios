//
//  JSONService.swift
//  EasyShopper
//
//  Created by Matt Bonney on 2/1/23.
//  Copyright © 2023 Ka-ching. All rights reserved.
//

import Foundation

/// Custom JSON Decoder service that is pre-set to handle snake-case keys.
class JSONService {
    let decoder: JSONDecoder

    init(keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase) {
        self.decoder = JSONDecoder()
        self.decoder.keyDecodingStrategy = keyDecodingStrategy
    }
}
