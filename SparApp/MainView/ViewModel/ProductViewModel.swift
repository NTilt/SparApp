//
//  ProductViewModel.swift
//  SparApp
//
//  Created by Никита Ясеник on 14.08.2023.
//

import Foundation

class ProductViewModel: ObservableObject {
    
    @Published var recommendedProducts: [Product] = [
        Product(image: "goods_1", price: 279.90, unitMeasurement: .pc, promotion: .cardPrice),
        Product(image: "goods_2", price: 120.90, unitMeasurement: .gr, promotion: .superPrice, discount: 20),
    ]
    
    @Published var sweetProducts: [Product] = [
        Product(image: "sweet_1", price: 99.90, unitMeasurement: .pc, promotion: .superPrice),
        Product(image: "sweet_2", price: 99.90, unitMeasurement: .pc, promotion: .new),
        Product(image: "sweet_3", price: 99.90, unitMeasurement: .pc),
    ]
    
}

struct Product: Identifiable, Hashable {
    var id = UUID().uuidString
    var image: String
    var price: Float
    var unitMeasurement: UnitMeasurement
    var promotion: Promotion?
    var discount: Int?
}

enum Promotion {
    case cardPrice
    case new
    case superPrice
}

enum UnitMeasurement {
    case gr
    case pc
}
