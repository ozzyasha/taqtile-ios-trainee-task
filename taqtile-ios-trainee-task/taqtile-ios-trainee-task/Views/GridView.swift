//
//  GridView.swift
//  taqtile-ios-trainee-task
//
//  Created by Наталья Мазур on 27.07.24.
//

import SwiftUI

struct GridView: View {
    
    @ObservedObject var imageVM: ImageViewModel
    @State private var columns: [GridItem] = [
        GridItem(.flexible(minimum: 120, maximum: 180), spacing: 10),
        GridItem(.flexible(minimum: 120, maximum: 180), spacing: 10),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns,
                      alignment: .center,
                      spacing: 10,
                      pinnedViews: [.sectionHeaders, .sectionFooters]
            ) {
                ForEach(imageVM.imageCatalogueModel, id: \.id) { image in
                    ImageViewGridCell(image: image)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                }
            }
            .frame(maxHeight: .infinity)
            .alert(imageVM.errorMessage, isPresented: $imageVM.showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
    
}

#Preview {
    GridView(imageVM: ImageViewModel())
}
