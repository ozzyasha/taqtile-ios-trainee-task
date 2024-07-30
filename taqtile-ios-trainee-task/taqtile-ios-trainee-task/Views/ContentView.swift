//
//  ContentView.swift
//  taqtile-ios-trainee-task
//
//  Created by Наталья Мазур on 26.07.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText = ""
    @State var isGrid = false
    @StateObject private var imageVM = ImageViewModel()
    
    var body: some View {
        VStack {
            HStack() {
                Spacer()
                Toggle(isOn: $isGrid) {
                    Image(systemName: isGrid ? "rectangle.grid.1x2" : "rectangle.grid.2x2")
                        .font(.system(size: 25))
                        .foregroundStyle(.blue)
                }
                .toggleStyle(.button)
                .padding(.trailing)
            }
            
            SearchFieldView(searchText: $searchText, imageVM: imageVM)
            
            if isGrid {
                GridView(imageVM: imageVM)
            } else {
                ListView(imageVM: imageVM)
            }
        }
        .background(Color(.systemGray5))
    }
}

#Preview {
    ContentView()
}
