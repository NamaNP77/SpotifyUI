//
//  User.swift
//  SpotifyUI
//
//  Created by NamaN  on 20/04/24.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable , Identifiable{
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height: Int
    let weight: Double
    
    static var mock : User{
        User(
            id: 444,
            firstName: "Naman",
            lastName: "Patel",
            age: 22,
            email: "naman@gmail.com",
            phone: "9181881811",
            username: "iNaman77",
            password: "something",
            image: Constants.randomImage,
            height: 180,
            weight: 76
        )
    }
}
