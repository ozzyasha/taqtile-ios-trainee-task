//
//  ListView.swift
//  taqtile-ios-trainee-task
//
//  Created by Наталья Мазур on 27.07.24.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject
    var imageVM: ImageViewModel
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        List(imageVM.imageCatalogueModel, id: \.id) { image in
            ImageViewListCell(image: image)
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .background(Color(.systemGray5))
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Ошибка"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
}

#Preview {
    ListView(imageVM: ImageViewModel())
}
