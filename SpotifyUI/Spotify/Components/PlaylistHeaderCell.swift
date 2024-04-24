//
//  PlaylistHeaderCell.swift
//  SpotifyUI
//
//  Created by NamaN  on 24/04/24.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderCell: View {
    
    var height : CGFloat = 300
    var title : String = "SomeTitle"
    var subtitle : String = "Subtitle goes here"
    var imageName : String = Constants.randomImage
    var shadowColor : Color = Color.spotifyBlack.opacity(0.8)
    
    var body: some View {
        ImageLoaderView(urlString: imageName)
            .overlay(alignment : .bottomLeading){
                VStack(alignment: .leading, spacing : 8){
                    Text(subtitle)
                        .font(.headline)
                    
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding()
                .foregroundStyle(.spotifyWhite)
                .frame(maxWidth: .infinity, alignment : .leading)
                .background(
                    LinearGradient(colors: [shadowColor.opacity(0), shadowColor], startPoint: .top, endPoint: .bottom)
                )
                
            }
            .asStretchyHeader(startingHeight: 300)
            .frame(height: height)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        ScrollView {
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
}
