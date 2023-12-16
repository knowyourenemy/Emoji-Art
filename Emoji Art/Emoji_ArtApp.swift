//
//  Emoji_ArtApp.swift
//  Emoji Art
//
//  Created by Aaditya Patwari on 16/12/23.
//

import SwiftUI

@main
struct Emoji_ArtApp: App {
    @StateObject var defaultDocument = EmojiArtDocument()
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: defaultDocument)
        }
    }
}
