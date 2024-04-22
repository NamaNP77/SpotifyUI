//
//  SpotifyCategoryCell.swift
//  SpotifyUI
//
//  Created by NamaN  on 22/04/24.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title : String = "All"
    var isSelected : Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
            .cornerRadius(16)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        VStack(spacing : 40){
            SpotifyCategoryCell(title: "Random String")
            SpotifyCategoryCell(title: "Random String", isSelected: true)
            SpotifyCategoryCell(isSelected: true)
        }
        
    }
}
