//
//  LibraryEmptyView.swift
//  AppleMusic
//
//  Created by Стас on 15.06.2021.
//

import SwiftUI

struct LibraryEmptyView: View {
    var body: some View {
        Text("Ищете свою музыку?")
            .font(.title2).bold()
        Text("Здесь появляется купленная Вами в iTunes Store музыка")
            .multilineTextAlignment(.center)
            .frame(width: 300)
            .foregroundColor(.secondary)
    }
}

struct LibraryEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryEmptyView()
    }
}
