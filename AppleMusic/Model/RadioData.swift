//
//  RadioData.swift
//  AppleMusic
//
//  Created by Стас on 07.06.2021.
//

import SwiftUI

struct Radio: Identifiable {
    let id = UUID()
    let category: String
    let title: String
    let subtitle: String
    let image: String
}
    var radios = [
    Radio(category: "ОБНОВЛЕННЫЙ ПЛЕЙЛИСТ", title: "Кирилица", subtitle: "Apple Music русский хип-хоп", image: "1"),
    Radio(category: "НОВЫЙ EP", title: "COVERS - EP", subtitle: "Little Big", image: "4"),
    Radio(category: "СЛУШАЙ НОВЫЕ СИНГРЫ", title: "Happier Than Ever", subtitle: "Billie Eilish", image: "2"),
    Radio(category: "ИЗБРАННЫЙ ПЛЕЙЛИСТ", title: "Россия: Blach Music Month", subtitle: "Apple Music", image: "3")
]

struct RadioStation: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let image: String
}
var radioStations = [
    RadioStation(title: "Популярное", subtitle: "То, что слушают прямо сейчас", image: "66"),
    RadioStation(title: "Музыка для расслабления", subtitle: "Электронная медитация", image: "55"),
    RadioStation(title: "Альтернативная музыка", subtitle: "Для тех, кто выбирает свой путь", image: "77"),
    RadioStation(title: "Классика альтернативной музыки", subtitle: "Как зараждалась альтернативная сцена", image: "88"),
    RadioStation(title: "Инди-музыка", subtitle: "Молодые, яркие, независимые", image: "99"),
    RadioStation(title: "Adult alternarive", subtitle: "Серьезный взгляд на альтернативную музыку", image: "101"),
    RadioStation(title: "Канадская инди-музыка", subtitle: "Песни свободного духа прямиком из Канады", image: "102")
]


