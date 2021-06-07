//
//  RadioView.swift
//  AppleMusic
//
//  Created by Стас on 03.06.2021.
//

import SwiftUI

struct RadioView: View {

    let hGridLayout = [ GridItem(.flexible(maximum: 200)) ]
    let columns = [ GridItem(.adaptive(minimum: 400)) ]

    var body: some View {

        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
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
                Divider()

                LazyVGrid(columns: columns) {
                    Text("Станции")
                        .font(.title2).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ForEach(radioStations) {item in
                        HStack {
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100.0, height: 100.0, alignment: .leading)
                                .cornerRadius(3)

                            VStack (spacing: 5) {
                                Text (item.title)
                                    .padding(.leading, 10.0)
                                    .padding(.top, 30.0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size: 18))
                                    .frame(alignment: .leading)
                                    .lineLimit(2)
                                    .fixedSize(horizontal: false, vertical: true)
                                Text (item.subtitle)
                                    .padding(.leading, 10.0)
                                    .padding(.bottom, 25.0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size: 12))
                                    .foregroundColor(.secondary)
                                Divider()
                            }// VStack
                            .frame(maxHeight: 100)
                        } // HStack
                    } // ForEach
                } // LazyVGrid
            } // ScrollView Vertical
            .padding()
            .navigationBarTitle("Радио")
        } // NavigationView
    }
}

struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
    }
}
