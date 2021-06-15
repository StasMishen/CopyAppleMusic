//
//  MainGalleryView.swift
//  AppleMusic
//
//  Created by Стас on 15.06.2021.
//

import SwiftUI

struct MainGalleryView: View {
    
    let hGridLayout = [ GridItem(.flexible(maximum: 200)) ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: hGridLayout) {
                ForEach(radios) {item in
                    VStack {
                        Divider()
                            .padding(.top, 4.0)
                        Text (item.category)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 10))
                            .foregroundColor(.secondary)
                        Text (item.title)
                            .frame(maxWidth: 370, alignment: .leading)
                            .font(.system(size: 20))
                            .frame(alignment: .leading)
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                        Text (item.subtitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 20))
                            .foregroundColor(.secondary)
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 370.0, height: 260.0, alignment: .leading)
                            .cornerRadius(10)
                    } // VStack
                } // ForEach
            } // LazyHGrid
        } // ScrollView Horizontal
        .frame(height: 344.0)
    }
}

struct MainGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        MainGalleryView()
    }
}
