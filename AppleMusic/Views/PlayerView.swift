//
//  PlayerView.swift
//  AppleMusic
//
//  Created by Стас on 15.06.2021.
//

import SwiftUI

struct PlayerView: View {
    var body: some View {

        HStack(spacing: 15) {
            Image("noMusic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 47, height: 47)
                .padding(.leading)
                .cornerRadius(5)
                .shadow(radius: 4)
            Text("Не исполняется")
                .font(.system(size: 18, weight: .regular, design: .default))
                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.201))
                .padding(.leading, 5)
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "play.fill")
                    .font(.title2)
                    .foregroundColor(.primary)
                    .padding(.trailing)
            })
            Button(action: {}, label: {
                Image(systemName: "forward.fill")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.trailing)
            })
        }
        .padding(.horizontal)
        .frame(height: 65)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.965, green: 0.973, blue: 0.969)/*@END_MENU_TOKEN@*/)
        .offset(y: -50)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
