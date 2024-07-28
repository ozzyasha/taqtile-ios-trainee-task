//
//  ImageViewModel.swift
//  taqtile-ios-trainee-task
//
//  Created by Наталья Мазур on 26.07.24.
//

import Foundation

class ImageViewModel: ObservableObject {
    
    @Published var imageCatalogueModel = [ImageCatalogueModel.Hit]()
    @Published var errorMessage = ""
    @Published var showAlert = false
    
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
    
}
