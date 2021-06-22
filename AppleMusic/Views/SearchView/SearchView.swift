//
//  SearchView.swift
//  AppleMusic
//
//  Created by Стас on 03.06.2021.
//

import SwiftUI
import UIKit

struct SomeView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        return SearchViewUIKit()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

struct SearchView: View {
    var body: some View {
        SomeView()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
