//
//  ImageViewGridCell.swift
//  taqtile-ios-trainee-task
//
//  Created by Наталья Мазур on 27.07.24.
//

import SwiftUI
import Photos

struct ImageViewGridCell: View {
    @State var image: ImageCatalogueModel.Hit
    @State private var showSaveAlert = false
    @State private var errorMessage = ""
    @ObservedObject private var imageVM = ImageViewModel()
    
    private enum Constants {
        static let imageWidth: CGFloat = 200
    }
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                // MARK: - Image View
                let imageURL = URL(string: image.webformatURL)
                
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if phase.error != nil {
                        AsyncImage(url: imageURL) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } else if phase.error != nil {
                                ZStack {
                                    Color.gray.opacity(0.2)
                                    Text("Failed to load image.")
                                }
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
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        }
                    }
                }
                .onTapGesture {
                    showSaveAlert = true
                }
                Spacer()
                
                // MARK: - User Info
                let userImageURL = URL(string: self.image.userImageURL)
                
                HStack {
                    AsyncImage(url: userImageURL) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 30, height: 30)
                        } else if phase.error != nil {
                            AsyncImage(url: userImageURL) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .clipShape(Circle())
                                        .frame(width: 30, height: 30)
                                } else if phase.error != nil {
                                    DefaultUserImageView(size: 30)
                                } else {
                                    DefaultUserImageView(size: 30)
                                }
                            }
                        } else {
                            DefaultUserImageView(size: 30)
                        }
                    }
                    
                    Text("\(self.image.user)")
                        .foregroundStyle(.black)
                        .font(.system(size: 12))
                    Spacer()
                }
                .padding(.horizontal)
                
                Divider()
                
                // MARK: - Image Info
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "heart.circle.fill")
                                .foregroundStyle(.red)
                                .frame(width: 10, height: 10)
                                .scaledToFit()
                            Text("\(self.image.likes)")
                                .foregroundStyle(.black)
                                .font(.system(size: 10))
                        }
                        HStack {
                            Image(systemName: "message.circle.fill")
                                .foregroundStyle(.green)
                                .frame(width: 10, height: 10)
                                .scaledToFit()
                            Text("\(self.image.comments)")
                                .foregroundStyle(.black)
                                .font(.system(size: 10))
                        }
                        HStack {
                            Image(systemName: "eye.circle.fill")
                                .foregroundStyle(.blue)
                                .frame(width: 10, height: 10)
                                .scaledToFit()
                            Text("\(self.image.views)")
                                .foregroundStyle(.black)
                                .font(.system(size: 10))
                        }
                    }
                    Spacer()
                    Text("\(self.image.tags.replacingOccurrences(of: ",", with: "\n"))")
                        .foregroundStyle(.gray)
                        .font(.system(size: 10))
                        .multilineTextAlignment(.trailing)
                }
                .padding()
            }
        }
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
        .alert("Сохранить картинку?", isPresented: $showSaveAlert) {
            Button("Сохранить") {
                imageVM.saveImageToGallery(imageURL: image.webformatURL, dataCompletion: { data in
                    UIImageWriteToSavedPhotosAlbum(UIImage(data: data)!, nil, nil, nil)
                }, errorCompletion: { errorText in
                    errorMessage = errorText
                })
                
            }
            Button("Отмена", role: .cancel) {}
        }
        .alert(errorMessage, isPresented: $imageVM.showSaveImageErrorAlert) {
            Button("OK", role: .cancel) {}
        }
    }
    
    
}

#Preview {
    ImageViewGridCell(image: ImageCatalogueModel.Hit(id: 1, webformatURL: "https://pixabay.com/get/g0b411effc57428af80f01a7402f5b170363b3653f2e370c0c95105b35b3e8830037d06fb01892dafe73c6180b577794e6ad46d4b559b428152d4d36636ad9dc4_1280.jpg", tags: "flower, stamens, nature", likes: 500, views: 60, comments: 700, user: "username", userImageURL: "https://cdn.pixabay.com/user/2024/07/23/14-15-02-267_250x250.jpg"))
}


