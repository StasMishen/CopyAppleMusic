//
//  ContentView.swift
//  AppleMusic
//
//  Created by Стас on 03.06.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom),
               content: {
        TabView() {
            LibraryView()
            .tabItem {
                Image(systemName: "music.note.house.fill")
                Text("Медиатека")
            }.tag(0)
            RadioView()
                .tabItem {
                    Image(systemName: "dot.radiowaves.left.and.right")
                    Text("Радио")
                }.tag(1)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Поиск")
                }.tag(2)
        }
        .accentColor(.red)
        PlayerView()

               })
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
