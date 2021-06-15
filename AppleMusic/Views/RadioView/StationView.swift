//
//  StationView.swift
//  AppleMusic
//
//  Created by Стас on 15.06.2021.
//

import SwiftUI

struct StationView: View {

    let columns = [ GridItem(.adaptive(minimum: 400)) ]
    
    var body: some View {
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
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 18))
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                        Text (item.subtitle)
                            .padding(.leading, 10.0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 12))
                            .foregroundColor(.secondary)
                    }// VStack
                    .frame(maxHeight: 100)
                } // HStack
                Divider()
                    .padding(.leading, 115)
            } // ForEach
        } // LazyVGrid
    }
}

struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        StationView()
    }
}
