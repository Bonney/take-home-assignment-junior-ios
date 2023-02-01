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
    @State private var showProductView: Bool = false

    var body: some View {
        NavigationStack() {
            ShoppingBasketView()
                .sheet(isPresented: $showProductView) {
                    NavigationStack {
                        ProductInventoryView()
                    }
                    .presentationDetents([.medium, .large])
                }
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        showInventoryButton
                            .labelStyle(.titleAndIcon)
                        clearBasketButton
                            .tint(.red)
                    }
                }
        }
    }

    var showInventoryButton: some View {
        Button {
            showProductView.toggle()
        } label: {
            Label("Add Items", systemImage: "plus")
        }
    }

    var clearBasketButton: some View {
        Button(role: .destructive) {
            // shoppingBasket.emptyOfAllItems()
        } label: {
            Text("Clear All")
        }
        .disabled(shoppingBasket.contents.isEmpty)
    }
}

struct AppEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AppEntryView()
            .environmentObject(ShoppingBasket())
            .environmentObject(ProductInventory())
    }
}
