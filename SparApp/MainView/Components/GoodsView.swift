//
//  GoodsView.swift
//  SparApp
//
//  Created by Никита Ясеник on 13.08.2023.
//

import SwiftUI

struct GoodsView: View {
    
    @StateObject var productsModel = ProductViewModel()
    
    var body: some View {
        VStack {
            GoodsSection(title: "Рекомендуем", products: productsModel.recommendedProducts)
            GoodsSection(title: "Сладкое настроение", products: productsModel.sweetProducts)
        }
        
    }
}

struct GoodsSection: View {
    
    var title: String
    @State var products: [Product]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0 ..< 10) { index in
                        GoodsItem(product: products[index % products.count])
                            .padding(.leading, index == 0 ? 18 : 0)
                    }
                }
                .padding(.vertical)
            }
            
        }
        
        
    }
}

struct GoodsItem: View {
    
    var product: Product
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 0) {
            Image(product.image)
                .resizable()
                .scaledToFit()
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    HStack(spacing: 5) {
                        Text(String(format: "%.2f", product.price))
                            .foregroundColor(colorScheme == .dark ? .white:  Color(red: 0.145, green: 0.145, blue: 0.157, opacity: 1))
                            .font(.footnote)
                            .fontWeight(.bold)
                        if product.unitMeasurement == .gr {
                            Text("\u{20BD}/ \n100гр")
                                .font(.system(size: 8))
                                .fontWeight(.bold)
                                .foregroundColor(colorScheme == .dark ? .white: Color(red: 0.145, green: 0.145, blue: 0.157, opacity: 1))
                        }
                        else {
                            UnitView(currency: .rub, unitMeasurement: product.unitMeasurement)
                        }
                    }
                    if product.discount != nil {
                        Text("479.90")
                            .strikethrough(true, color: colorScheme == .dark ? .white.opacity(0.5): .black.opacity(0.5))
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                Button {
                    
                } label: {
                    Image("addToCart")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 15, height: 15)
                        
                        .foregroundColor(.white)
                        .padding(8)
                        .background(
                            Circle()
                                .fill(.green)
                        )
                        
                }
                .accessibilityElement()
                .accessibilityLabel(product.id)
                .anchorPreference(key: AddCartPreferenceKey.self, value: .bounds, transform: {
                    [AddButtonPreference(product: product, anchor: $0)]
                })
                
            }
        }
        .frame(maxWidth: 120, maxHeight: 180)
        .padding(.horizontal, 9)
        .padding(.vertical, 9)
        .background (
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(height: 170)
                .offset(y: -34)
        )
        .background(colorScheme == .dark ? Color(red: 0.145, green: 0.145, blue: 0.157, opacity: 1) : .white)
        .cornerRadius(18)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 0)
        .overlay(
            
            GeometryReader { reader in
                if let promotion = product.promotion {
                    CustomShapeView(promotion: promotion)
                }
            }
        )
        .overlayPreferenceValue(AddCartPreferenceKey.self) { preferences in
            GeometryReader { geo in
                if let discount = product.discount, let selected = preferences.first(where: {
                    $0.product == product
                }) {
                    let frame = geo[selected.anchor]
                    DiscountView(discount: discount)
                        .position(x: frame.midX, y: frame.minY - 20)
                }
            }
        }
    }
    
}

struct ProductPreference: Equatable {
    let product: Product
    let anchor: Anchor<CGRect>
}

struct ProductPreferenceKey: PreferenceKey {
    static let defaultValue = [ProductPreference]()
    
    static func reduce(value: inout [ProductPreference], nextValue: () -> [ProductPreference]) {
        value.append(contentsOf: nextValue())
    }
}

struct AddButtonPreference: Equatable {
     let product: Product
     let anchor: Anchor<CGRect>
}

struct AddCartPreferenceKey: PreferenceKey {
    static let defaultValue = [AddButtonPreference]()
    
    static func reduce(value: inout [AddButtonPreference], nextValue: () -> [AddButtonPreference]) {
        value.append(contentsOf: nextValue())
    }
}

struct GoodsView_Previews: PreviewProvider {
    static var previews: some View {
        GoodsView()
    }
}
