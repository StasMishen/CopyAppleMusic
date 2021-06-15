//
//  FilterData.swift
//  AppleMusic
//
//  Created by Стас on 03.06.2021.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
}
    var items = [
    Item(title: "Плейлисты", icon: "music.note.list"),
    Item(title: "Артисты", icon: "music.mic"),
    Item(title: "Альбомы", icon: "square.stack"),
    Item(title: "Песни", icon: "music.note"),
    Item(title: "Телешоу", icon: "tv"),
    Item(title: "Видеоклипы", icon: "tv.music.note"),
    Item(title: "Жанры", icon: "guitars"),
    Item(title: "Сборники", icon: "person.2.square.stack"),
    Item(title: "Авторы", icon: "music.quarternote.3"),
    Item(title: "Загружено", icon: "arrow.down.circle"),
    Item(title: "Домашняя коллекция", icon: "music.note.house")
]
