//
//  ImageViewListCell.swift
//  taqtile-ios-trainee-task
//
//  Created by Наталья Мазур on 27.07.24.
//

import SwiftUI

struct ImageViewListCell: View {
    @State var image: ImageCatalogueModel.Hit
    
    private enum Constants {
        static let imageWidth: CGFloat = 200
    }
    
    var body: some View {
        AsyncImage(url: URL(string: image.webformatURL)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    ImageViewListCell(image: ImageCatalogueModel.Hit(id: 1, webformatURL: "https://pixabay.com/get/g0b411effc57428af80f01a7402f5b170363b3653f2e370c0c95105b35b3e8830037d06fb01892dafe73c6180b577794e6ad46d4b559b428152d4d36636ad9dc4_1280.jpg"))
}


