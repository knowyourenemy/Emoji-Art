//
//  PaletteEditor.swift
//  Emoji Art
//
//  Created by Aaditya Patwari on 20/12/23.
//

import SwiftUI

struct PaletteEditor: View {
    @Binding var palette: Palette
    
    private let emojiFont = Font.system(size: 40)
    
    @State private var emojisToAdd: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Name", text: $palette.name)
            }
            Section(header: Text("Emojis")){
                TextField("Add Emojis Here", text: $emojisToAdd)
                    .font(emojiFont)
                    .onChange(of: emojisToAdd) {
                        palette.emojis = (emojisToAdd + palette.emojis)
                            .filter { $0.isEmoji }
                            .uniqued
                    }
                removeEmojis
            }
        }
        .frame(minWidth: 300, minHeight: 300)
    }
    
    var removeEmojis: some View {
        VStack(alignment: .trailing) {
            Text("Tap to Remove Emojis").font(.caption).foregroundColor(.gray)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))]) {
                ForEach(palette.emojis.uniqued.map(String.init), id: \.self) { emoji in
                    Text(emoji)
                        .onTapGesture {
                            withAnimation {
                                palette.emojis.remove(emoji.first!)
                                emojisToAdd.remove(emoji.first!)
                            }
                        }
                }
            }
        }
        .font(emojiFont)
    }
}

//#Preview {
//    PaletteEditor()
//}
