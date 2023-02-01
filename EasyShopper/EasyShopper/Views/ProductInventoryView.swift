//
//  ProductInventoryView.swift
//  EasyShopper
//
//  Created by Matt Bonney on 2/1/23.
//  Copyright © 2023 Ka-ching. All rights reserved.
//

import SwiftUI

struct ProductInventoryView: View {
    @EnvironmentObject private var inventory: ProductInventory

    var body: some View {
        List {
            if let error = inventory.error {
                Text(error.localizedDescription).foregroundColor(.red)
            }
            ForEach(inventory.products) { product in
                LabeledContent(product.name ?? "", value: product.retailPrice, format: .currency(code: "USD"))
            }
        }
        .navigationTitle("Inventory")
    }
}

struct ProductInventoryView_Previews: PreviewProvider {
    static var previews: some View {
        ProductInventoryView()
            .environmentObject(ProductInventory())
    }
}
