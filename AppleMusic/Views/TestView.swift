//
//  LibraryView.swift
//  AppleMusic
//
//  Created by Стас on 03.06.2021.
//

import SwiftUI

struct TestView: View {

    @State private var editMode = EditMode.active
    @State private var multiSelection = Set<UUID>()
    @State private var showFilter = true

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 6) {
            if showFilter {
            List(selection: $multiSelection) {

                ForEach(items) {item in
                    HStack {
                        Image(systemName: item.icon)
                            .foregroundColor(.red)
                            .font(.system(size: 20))
                            .frame(width: 20, alignment: .trailing)
                        Text (item.title)
                            .font(.system(size: 20))
                    }
                }
                .onMove(perform: moveList)
            } .listStyle(InsetListStyle())
                } else {
                    Text("Ищете свою музыку?")
                        .font(.title2).bold()
                    Text("Здесь появляется купленная Вами в iTunes Store музыка")
                        .multilineTextAlignment(.center)
                        .frame(width: 300)
                        .foregroundColor(.secondary)
                }
            }


            .accentColor(.red)
            .navigationBarTitle("Медиатека")
            .environment(\.editMode, .constant(showFilter ? EditMode.active : EditMode.inactive))
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showFilter.toggle()
                                    }, label : {
                                        if showFilter {
                                            Text("Готово")
                                                .font(.body)
                                                .foregroundColor(Color.red)
                                        } else {
                                            Text("Править")
                                                .font(.body)
                                                .foregroundColor(Color.red)
                                        }

                                    }))

        }


    }

    func moveList(source: IndexSet, destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}


