//
//  ProductDetailView.swift
//  EasyShopper
//
//  Created by Matt Bonney on 2/1/23.
//  Copyright © 2023 Ka-ching. All rights reserved.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject private var basket: ShoppingBasket
    let product: Product

    var body: some View {
        List {
            Section {
                title()

                image()
                    .frame(minHeight: 250)
                    .cornerRadius(4)
                    .listRowSeparator(.hidden)

                Text(product.retailPrice, format: .currency(code: "USD"))
                    .font(.title3)

                Text(product.description ?? "")
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                addToCart()
            }
        }
    }

    @ViewBuilder func title() -> some View {
        Text(product.name ?? "")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .fontWidth(.expanded)
    }

    @ViewBuilder func image() -> some View {
        if let urlString = product.imageUrl, let url = URL(string: urlString) {
            AsyncImage(url: url) { loadedImageView in
                loadedImageView
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
        } else {
            Image(systemName: "exclamationmark.octagon")
        }
    }

    @ViewBuilder func addToCart() -> some View {
        Button {
            basket.contents.append(product)
        } label: {
            Text("Add to Cart")
        }
    }

}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ProductDetailView(product: .preview_05)
                .environmentObject(ShoppingBasket())
        }
    }
}
