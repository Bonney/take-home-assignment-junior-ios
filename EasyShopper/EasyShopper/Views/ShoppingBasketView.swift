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

    var listData: [ShoppingBasketItem] {
        basket.groupContentsByQuantity()
    }

    var body: some View {
        List {
            if basket.contents.isEmpty {
                Text("Your basket is empty.")
            }

            ForEach(listData) { basketItem in

                Section {
                    Text(basketItem.product.name ?? "")
                    LabeledContent {
                        Text(basketItem.totalRetailPrice, format: .currency(code: "USD"))
                            .foregroundStyle(.primary)
                            .bold()
                    } label: {
                        Text(basketItem.quantity, format: .number) + Text(" × ") + Text(basketItem.product.retailPrice, format: .currency(code: "USD"))
                    }
                    .foregroundStyle(.secondary)
                } footer: {
                }
                .monospacedDigit()

            }
        }
        .navigationTitle("Your Cart")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Total")
                        .font(.caption.bold())
                        .textCase(.uppercase)
                        .foregroundStyle(.secondary)
                    Text(listData.grandTotalRetailPrice(), format: .currency(code: "USD"))
                        .font(.title2)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

                Button("Go to Checkout") {
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .buttonBorderShape(.capsule)
                .padding(8)
            }
            .background(.bar, ignoresSafeAreaEdges: .bottom)
            .overlay(alignment: .top) { Divider() }
        }
    }
}

struct ShoppingBasketView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ShoppingBasketView()
                .environmentObject(ShoppingBasket.preview)
        }
    }
}
