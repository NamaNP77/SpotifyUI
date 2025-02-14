//
//  Product.swift
//  SpotifyUI
//
//  Created by NamaN  on 20/04/24.
//

import Foundation

struct ProductArray : Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable , Identifiable{
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
    
    var firstImage : String{
        images.first ?? Constants.randomImage
    }
    
    static var mock : Product {
        Product(
            id: 123,
            title: "Example Product Title",
            description: "This is some mock product description that goes here",
            price: 999,
            discountPercentage: 10,
            rating: 4.5,
            stock: 50,
            brand: "Apple",
            category: "Electronic",
            thumbnail: Constants.randomImage,
            images: [Constants.randomImage,Constants.randomImage,Constants.randomImage]
        )
    }
}

struct ProductRow : Identifiable{
    let id = UUID().uuidString
    let title : String
    let products : [Product]
}
