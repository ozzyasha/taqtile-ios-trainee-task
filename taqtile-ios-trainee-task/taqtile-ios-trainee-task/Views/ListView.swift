//
//  ListView.swift
//  taqtile-ios-trainee-task
//
//  Created by Наталья Мазур on 27.07.24.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var imageVM: ImageViewModel
    
    var body: some View {
        List(imageVM.imageCatalogueModel, id: \.id) { image in
            ImageViewListCell(image: image)
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .background(Color(.systemGray5))
        .alert(imageVM.errorMessage, isPresented: $imageVM.showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
    
}

#Preview {
    ListView(imageVM: ImageViewModel())
}
