//
//  SpotifyPlaylistView.swift
//  SpotifyUI
//
//  Created by NamaN  on 24/04/24.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    
    var product : Product = .mock
    var user : User = .mock
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical){
                LazyVStack(spacing: 12){
                    PlaylistHeaderCell(height: 250, title: product.title, subtitle: product.brand, imageName: product.thumbnail)
                    
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
                    
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}
