//
//  ContentView.swift
//  SpotifyUI
//
//  Created by NamaN  on 20/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users : [User] = []
    @State private var products : [Product] = []
    
    
    var body: some View {
        VStack {
            ScrollView{
                VStack{
                    ForEach(users){ user in
                        Text(user.firstName)
                    }
                }
            }
        }
        .padding()
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProduct()
        } catch  {
            
        }
    }
}

#Preview {
    ContentView()
}
