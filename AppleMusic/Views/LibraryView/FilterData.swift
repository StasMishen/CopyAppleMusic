//
//  FilterData.swift
//  AppleMusic
//
//  Created by Стас on 03.06.2021.
//

import SwiftUI

struct Filter: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
}
extension Filter {
    static var item = [
        Filter(title: "Плейлисты", icon: "music.note.list"),
        Filter(title: "Артисты", icon: "music.mic"),
        Filter(title: "Альбомы", icon: "square.stack"),
        Filter(title: "Песни", icon: "music.note"),
        Filter(title: "Телешоу", icon: "tv"),
        Filter(title: "Видеоклипы", icon: "tv.music.note"),
        Filter(title: "Жанры", icon: "guitars"),
        Filter(title: "Сборники", icon: "person.2.square.stack"),
        Filter(title: "Авторы", icon: "music.quarternote.3"),
        Filter(title: "Загружено", icon: "arrow.down.circle"),
        Filter(title: "Домашняя коллекция", icon: "music.note.house")
    ]
}
