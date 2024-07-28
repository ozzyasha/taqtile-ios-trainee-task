//
//  ImageViewGridCell.swift
//  taqtile-ios-trainee-task
//
//  Created by Наталья Мазур on 27.07.24.
//

import SwiftUI

struct ImageViewGridCell: View {
    @State var image: ImageCatalogueModel.Hit
    
    private enum Constants {
        static let imageWidth: CGFloat = 200
    }
    
    var body: some View {
        AsyncImage(url: URL(string: image.webformatURL)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            AsyncImage(url: URL(string: self.image.userImageURL)) { image in
                HStack {
                    image
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 30, height: 30)
                    Text("\(self.image.user)")
                        .foregroundStyle(.black)
                        .font(.system(size: 12))
                    Spacer()
                }
            } placeholder: {
                HStack {
                    ZStack {
                        Circle().frame(width: 30, height: 30)
                            .foregroundStyle(Color.gray)
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                            .offset(x: 0, y: 5)
                    }
                    .clipShape(Circle())
                    Text("\(self.image.user)")
                        .foregroundStyle(.black)
                        .font(.system(size: 12))
                    Spacer()
                }
            }
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "heart.circle.fill")
                            .foregroundStyle(.black)
                            .frame(width: 10, height: 10)
                            .scaledToFit()
                        Text("\(self.image.likes)")
                            .foregroundStyle(.black)
                            .font(.system(size: 12))
                            .padding(.trailing)
                    }
                    HStack {
                        Image(systemName: "message.circle.fill")
                            .foregroundStyle(.black)
                            .frame(width: 10, height: 10)
                            .scaledToFit()
                        Text("\(self.image.comments)")
                            .foregroundStyle(.black)
                            .font(.system(size: 12))
                            .padding(.trailing)
                    }
                    HStack {
                        Image(systemName: "eye.circle.fill")
                            .foregroundStyle(.black)
                            .frame(width: 10, height: 10)
                            .scaledToFit()
                        Text("\(self.image.views)")
                            .foregroundStyle(.black)
                            .font(.system(size: 12))
                    }
                }
                .padding(.leading, 5)
                Spacer()
                Text("Теги:\n\(self.image.tags.replacingOccurrences(of: ",", with: "\n"))")
                    .foregroundStyle(.black)
                    .font(.system(size: 12))
                    .multilineTextAlignment(.trailing)
            }
        } placeholder: {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            }
        }
    }
}

#Preview {
    ImageViewGridCell(image: ImageCatalogueModel.Hit(id: 1, webformatURL: "https://pixabay.com/get/g0b411effc57428af80f01a7402f5b170363b3653f2e370c0c95105b35b3e8830037d06fb01892dafe73c6180b577794e6ad46d4b559b428152d4d36636ad9dc4_1280.jpg", tags: "flower, stamens, nature", likes: 500, views: 60, comments: 700, user: "username", userImageURL: "https://cdn.pixabay.com/user/2024/07/23/14-15-02-267_250x250.jpg"))
}


