//
//  ImageViewModel.swift
//  taqtile-ios-trainee-task
//
//  Created by Наталья Мазур on 26.07.24.
//

import Foundation
import Photos

class ImageViewModel: ObservableObject {
    
    @Published var imageCatalogueModel = [ImageCatalogueModel.Hit]()
    @Published var errorMessage = ""
    @Published var showAlert = false
    @Published var showSaveImageErrorAlert = false
    
    func fetchImages(searchText: String) {
        APIService.shared.fetchData(searchText: searchText.replacingOccurrences(of: " ", with: "+").lowercased(), completionHandler: { imageCatalogue in
            DispatchQueue.main.async {
                self.imageCatalogueModel = imageCatalogue.hits
            }
        }, errorHandler: { error in
            DispatchQueue.main.async {
                self.showAlert = true
                self.errorMessage = "\(error)"
            }
        })
    }
    
    func saveImageToGallery(imageURL: String, dataCompletion: @escaping (Data) -> (), errorCompletion: @escaping (String) -> ()) {
        if let url = URL(string: imageURL) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let imageData = data else {
                    errorCompletion("Ошибка загрузки изображения: \(error?.localizedDescription ?? "undefined error")")
                    return
                }
                PHPhotoLibrary.requestAuthorization { status in
                    DispatchQueue.main.async {
                        switch status {
                        case .authorized:
                            dataCompletion(imageData)
                        case .denied, .restricted:
                            errorCompletion("Доступ к фотогалерее запрещен. Вы можете изменить настройки доступа в настройках приложения.")
                            self.showSaveImageErrorAlert = true
                        case .notDetermined:
                            errorCompletion("Доступ к фотогалерее еще не запрошен")
                            self.showSaveImageErrorAlert = true
                        default:
                            errorCompletion("Неизвестный статус")
                            self.showSaveImageErrorAlert = true
                        }
                    }
                }
            }.resume()
        }
    }
    
}
