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
    
    @State private var imageLoaded: Image?
    
    var body: some View {
        
        // MARK: - User Info
        let userImageURL = URL(string: self.image.userImageURL)
        
        HStack {
            AsyncImage(url: userImageURL) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                } else if phase.error != nil {
                    AsyncImage(url: userImageURL) { image in
                        image
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 50, height: 50)
                    } placeholder: {
                        DefaultUserImageView(size: 50)
                    }
                } else {
                    DefaultUserImageView(size: 50)
                }
            }
            Text("\(self.image.user)")
                .foregroundStyle(.black)
            Spacer()
        }
        
        // MARK: - Image Info
        
        let imageURL = URL(string: image.webformatURL)
        
        AsyncImage(url: imageURL) { phase in
            if let image = phase.image {
                ZStack(alignment: .bottom) {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.8), Color.black.opacity(0.3), Color.clear]), startPoint: .bottom, endPoint: .top)
                    HStack {
                        Image(systemName: "heart")
                            .foregroundStyle(.white)
                        Text("\(self.image.likes)")
                            .foregroundStyle(.white)
                            .padding(.trailing)
                        Image(systemName: "message")
                            .foregroundStyle(.white)
                        Text("\(self.image.comments)")
                            .foregroundStyle(.white)
                            .padding(.trailing)
                        Image(systemName: "eye")
                            .foregroundStyle(.white)
                        Text("\(self.image.views)")
                            .foregroundStyle(.white)
                            .padding(.trailing)
                    }
                    .padding()
                }
                Text("Теги: \(self.image.tags)")
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
            } else if phase.error != nil {
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        ZStack(alignment: .bottom) {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.8), Color.black.opacity(0.3), Color.clear]), startPoint: .bottom, endPoint: .top)
                            HStack {
                                Image(systemName: "heart")
                                    .foregroundStyle(.white)
                                Text("\(self.image.likes)")
                                    .foregroundStyle(.white)
                                    .padding(.trailing)
                                Image(systemName: "message")
                                    .foregroundStyle(.white)
                                Text("\(self.image.comments)")
                                    .foregroundStyle(.white)
                                    .padding(.trailing)
                                Image(systemName: "eye")
                                    .foregroundStyle(.white)
                                Text("\(self.image.views)")
                                    .foregroundStyle(.white)
                                    .padding(.trailing)
                            }
                            .padding()
                        }
                        Text("Теги: \(self.image.tags)")
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.center)
                    } else if phase.error != nil {
                        Text("Failed to load image.")
                    } else {
                        ZStack {
                            Color.gray.opacity(0.2)
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        }
                    }
                }
            } else {
                ZStack {
                    Color.gray.opacity(0.2)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                }
            }
        }
        .fixedSize()
        
        Divider()
    }
    
}

#Preview {
    ImageViewListCell(image: ImageCatalogueModel.Hit(id: 1, webformatURL: "https://pixabay.com/get/g0b411effc57428af80f01a7402f5b170363b3653f2e370c0c95105b35b3e8830037d06fb01892dafe73c6180b577794e6ad46d4b559b428152d4d36636ad9dc4_1280.jpg", tags: "flower, stamens, nature", likes: 500, views: 60, comments: 700, user: "username", userImageURL: "https://cdn.pixabay.com/user/2024/07/23/14-15-02-267_250x250.jpg"))
}


