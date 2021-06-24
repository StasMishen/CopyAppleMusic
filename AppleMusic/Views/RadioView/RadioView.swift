//
//  RadioView.swift
//  AppleMusic
//
//  Created by Стас on 03.06.2021.
//

import SwiftUI

struct RadioView: View {
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                MainGalleryView()
                Divider()
                StationView()
            }
            .padding()
            .padding(.bottom, 40)
            .navigationBarTitle("Радио")
        }
    }
}

struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
    }
}
