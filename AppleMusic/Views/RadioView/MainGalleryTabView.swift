//
//  MainGalleryTabView.swift
//  AppleMusic
//
//  Created by Стас on 15.06.2021.
//

import SwiftUI

struct MainGalleryTabView: View {

    @State var index = 0
    
    var body: some View {
        
        TabView(selection: self.$index){
            ForEach(radios) {item in
                VStack {
                    Divider()
                        .padding(.trailing, 10)
                    Text (item.category)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 10))
                        .foregroundColor(.secondary)
                    Text (item.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
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
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.trailing, 10)
                    
                } // VStack
            } // ForEach
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: 344.0)
    }
}

struct MainGalleryTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainGalleryTabView()
    }
}
