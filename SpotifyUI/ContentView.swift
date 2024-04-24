//
//  ContentView.swift
//  SpotifyUI
//
//  Created by NamaN  on 20/04/24.
//

import SwiftUI
import SwiftfulRouting

struct ContentView: View {
    
    @Environment(\.router) var router
 
    var body: some View {
        List{
            Button("Open Spotify"){
                router.showScreen(.fullScreenCover) { _ in
                    SpotifyHomeView()
                }
            }
        }
    }
}

#Preview {
    RouterView { _ in 
        ContentView()
    }
}
