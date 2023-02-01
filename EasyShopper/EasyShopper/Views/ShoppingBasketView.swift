//
//  ShoppingBasketView.swift
//  EasyShopper
//
//  Created by Matt Bonney on 2/1/23.
//  Copyright © 2023 Ka-ching. All rights reserved.
//

import SwiftUI

struct ShoppingBasketView: View {
    @EnvironmentObject private var basket: ShoppingBasket

    var body: some View {
        List {
            if basket.contents.isEmpty {
                Text("Your basket is empty.")
            }

            ForEach(basket.contents) { product in
                LabeledContent(product.name ?? "", value: product.retailPrice, format: .currency(code: "USD"))
            }
        }
        .navigationTitle("Shopping Basket")
    }
}

struct ShoppingBasketView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingBasketView()
            .environmentObject(ShoppingBasket())
    }
}
