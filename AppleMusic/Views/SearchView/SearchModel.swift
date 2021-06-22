//
//  SearchModel.swift
//  AppleMusic
//
//  Created by Стас on 22.06.2021.
//

import Foundation

var categories: [Category] = []

func populateCategory() {
    categories = [
        Category(name: "Хорошее настроение", imageName: "Хорошее настроение"),
        Category(name: "Спокойствие", imageName: "спокойствие"),
        Category(name: "Хиты", imageName: "Хиты"),
        Category(name: "Хип-хоп", imageName: "Хип-хоп"),
        Category(name: "Поп", imageName: "Поп"),
        Category(name: "Чарты", imageName: "Чарты"),
        Category(name: "Восход", imageName: "Восход"),
        Category(name: "Спорт", imageName: "Спорт"),
        Category(name: "Велнес", imageName: "Велнес"),
        Category(name: "Танцевальная", imageName: "Танцевальная"),
        Category(name: "Спорт", imageName: "Спорт"),
        Category(name: "Сон", imageName: "Сон"),
        Category(name: "Романтика", imageName: "Романтика"),
        Category(name: "Мотивация", imageName: "Мотивация"),
        Category(name: "Главное", imageName: "Главное"),
        Category(name: "Вечеринка", imageName: "Вечеринка")
    ]
}
