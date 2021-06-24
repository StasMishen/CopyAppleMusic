//
//  AppleMusicApp.swift
//  AppleMusic
//
//  Created by Стас on 03.06.2021.
//

import SwiftUI

@main
struct AppleMusicApp: App {
    var body: some Scene {
        WindowGroup {
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
                        SomeView()
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
}
