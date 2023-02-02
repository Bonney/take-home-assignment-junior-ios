//
//  AppEntryView.swift
//  EasyShopper
//
//  Created by Matt Bonney on 2/1/23.
//  Copyright © 2023 Ka-ching. All rights reserved.
//

import SwiftUI

struct AppEntryView: View {
    @EnvironmentObject private var shoppingBasket: ShoppingBasket
    @State private var isSheetVisible: Bool = false

    var base: some View {
        ProductInventoryView()
            .navigationDestination(for: Product.self) { product in
                ProductDetailView(product: product)
                    .toolbar(content: showCartButton)
            }
    }

    var sheet: some View {
        ShoppingBasketView()
    }

    var body: some View {
        NavigationStack {
            base
                .listStyle(.plain)
                .toolbar(content: showCartButton)
        }
        .sheet(isPresented: $isSheetVisible) {
            NavigationStack {
                sheet
            }
            .presentationDetents([.medium, .large])
        }
    }

    func showCartButton() -> some ToolbarContent {
        ToolbarItem(placement: .bottomBar) {
            Button {
                isSheetVisible.toggle()
            } label: {
                Label(cartButtonLabel, systemImage: "cart.fill")
                    .labelStyle(.titleAndIcon)
            }
        }
    }

    var cartButtonLabel: String {
        var base = "View Cart"
        if shoppingBasket.contents.count > 0 {
            base.append(" (\(shoppingBasket.contents.count))")
        }
        return base
    }
}

struct AppEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AppEntryView()
            .environmentObject(ShoppingBasket())
            .environmentObject(ProductInventory())
    }
}
