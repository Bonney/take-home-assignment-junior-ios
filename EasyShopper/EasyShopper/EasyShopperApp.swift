//
//  EasyShopperApp.swift
//  EasyShopper
//
//  Created by Matt Bonney on 2/1/23.
//  Copyright © 2023 Ka-ching. All rights reserved.
//

import SwiftUI

@main
struct EasyShopper_App: App {
    @StateObject private var shoppingBasket = ShoppingBasket()
    @StateObject private var productInventory = ProductInventory()

    var body: some Scene {
        WindowGroup {
            AppEntryView()
            .environmentObject(shoppingBasket)
            .environmentObject(productInventory)
        }
    }
}
