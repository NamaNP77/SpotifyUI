//
//  SpotifyHomeView.swift
//  SpotifyUI
//
//  Created by NamaN  on 22/04/24.
//

import SwiftUI

struct SpotifyHomeView: View {
    
    @State private var currentUser : User? = nil
    @State private var selectedCategory : Category? = .all
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical){
                
                LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders], content: {
                    Section {
                        ForEach(0 ..< 20) { _ in
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: 100, height: 100)
                        }
                    } header: {
                        header
                    }

                })
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .clipped()
            
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
//                products = try await DatabaseHelper().getProduct()
        } catch  {
            
        }
    }
    
    private var header : some View {
        HStack(spacing : 0){
            ZStack{
                if let currentUser{
                    ImageLoaderView(urlString: currentUser.image)
                        .background(Color.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                }
            }.frame(width: 35, height: 35)
            
            ScrollView(.horizontal) {
                HStack(spacing : 8){
                    ForEach(Category.allCases, id : \.self){ category in
                        SpotifyCategoryCell(title: category.rawValue.capitalized, isSelected: category == selectedCategory)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
                .padding(.horizontal,16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .frame(maxWidth: .infinity)
        .background(Color.spotifyBlack)
    }
}

#Preview {
    SpotifyHomeView()
}
