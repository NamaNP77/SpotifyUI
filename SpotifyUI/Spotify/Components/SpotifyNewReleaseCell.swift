//
//  SpotifyNewReleaseCell.swift
//  SpotifyUI
//
//  Created by NamaN  on 23/04/24.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    
    var imageName : String = Constants.randomImage
    var headline : String? = "New Release From"
    var subheadline : String? = "Some artist"
    var title : String? = "Some Playlist"
    var subtitle : String? = "Single - Title"
    var onAddToPlaylistPressed : (() -> Void)? = nil
    var onPlayPressed : (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing : 16){
            HStack(spacing : 8){
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                VStack(alignment : .leading,spacing: 2){
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }
                    if let subheadline {
                        Text(subheadline)
                            .foregroundStyle(.spotifyWhite)
                            .font(.title2)
                            .fontWeight(.medium)
                            
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment : .leading)
            
            HStack{
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140, height: 140)
                VStack(alignment : .leading, spacing : 32){
                    VStack(alignment : .leading, spacing : 2){
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                        }
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGray)
                        }
                    }
                    .font(.callout)
                    
                    HStack(spacing : 0){
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .background(Color.black.opacity(0.0001))
                            .onTapGesture { onAddToPlaylistPressed?() }
                            .offset(x : -4)
                            .frame(maxWidth: .infinity, alignment : .leading)
                        
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                    }
                }
                .padding(.trailing, 16)
            }
            .themeColors(isSelected: false)
            .cornerRadius(8)
            .onTapGesture {
                onPlayPressed?()
            }
        }
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        SpotifyNewReleaseCell()
            .padding()
    }
}
