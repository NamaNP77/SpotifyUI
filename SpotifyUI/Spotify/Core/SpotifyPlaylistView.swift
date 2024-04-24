//
//  SpotifyPlaylistView.swift
//  SpotifyUI
//
//  Created by NamaN  on 24/04/24.
//

import SwiftUI
import SwiftfulRouting

struct SpotifyPlaylistView: View {
    
    var product : Product = .mock
    var user : User = .mock
    
    @Environment (\.router) var router
    @State private var products : [Product] = []
    @State private var showHeader : Bool = false
    
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical){
                LazyVStack(spacing: 12){
                    PlaylistHeaderCell(height: 250, title: product.title, subtitle: product.brand, imageName: product.thumbnail)
                        .readingFrame { frame in
                            
                            showHeader = frame.maxY < 150
                        }
                    
                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        subheadline: product.category,
                        userName: user.firstName,
                        onAddtoPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsesPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
//                    .padding(.top)
                    
                    ForEach(products){product in
                        SongRowCell(
                            imageSize: 50,
                            title: product.title,
                            subtitle: product.brand,
                            imageName: product.firstImage,
                            onCellPressed: {
                             goToPlayListView(product: product)
                            },
                            onEllipsisPressed: nil
                        )
                        .padding(.leading, 16)
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            header
                .frame(maxHeight: .infinity, alignment: .top)
            
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            products = try await DatabaseHelper().getProduct()
        } catch  {
            
        }
    }
    
    private func goToPlayListView(product : Product){
        
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product, user: user)
        }
    }
    
    private var header : some View {
        ZStack{
            Text(product.title)
                .font(.headline)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(Color.spotifyBlack)
                .offset(y : showHeader ? 0 : -40)
                .opacity(showHeader ? 1:0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? Color.black.opacity(0.001) : .spotifyGray.opacity(0.7))
                .clipShape(Circle())
                .onTapGesture {
                    router.dismissScreen()
                }
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment : .leading)
                
        }
        .foregroundStyle(.spotifyWhite)
        .frame(maxWidth: .infinity)
        .animation(.smooth(duration: 0.2), value: showHeader)
    }
}

#Preview {
    RouterView{ _ in
        SpotifyPlaylistView()
    }
    
}
