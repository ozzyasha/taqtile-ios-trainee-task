//
//  APIService.swift
//  taqtile-ios-trainee-task
//
//  Created by Наталья Мазур on 26.07.24.
//

import Foundation

class APIService {
    
    private init() { }
    static let shared = APIService()
    
    private enum Constants {
        static let baseURL = "https://pixabay.com/api/"
        static let imageType = "photo"
    }
    
    func receiveApiKey() -> String {
        let configFilePath = Bundle.main.path(forResource: "config", ofType: "plist")
        let configDictionary = NSDictionary(contentsOfFile: configFilePath ?? "key path error")
        guard let apiKey = configDictionary?.value(forKey: "APIKey") as? String else {
            return "key receiving error"
        }
        return apiKey
    }
    
    func fetchData(searchText: String, completionHandler: ((ImageCatalogueModel) -> ())? = nil, errorHandler: ((APIError) -> ())? = nil) {
        let imagesURL = "\(Constants.baseURL)?key=\(receiveApiKey())&q=\(searchText)&image_type=\(Constants.imageType)"
        
        DispatchQueue.global().async {
            guard let url = URL(string: imagesURL) else {
                errorHandler?(APIError.urlError(String(localized: "URL error")))
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                guard error == nil else {
                    errorHandler?(APIError.requestError(error?.localizedDescription ?? String(localized: "Request error")))
                    return
                }
                
                guard let data = data else {
                    errorHandler?(APIError.responseError(error?.localizedDescription ?? String(localized: "Response error")))
                    return
                }
                
                guard let decodedResponse = try? JSONDecoder().decode(ImageCatalogueModel.self, from: data) else {
                    errorHandler?(APIError.decodeError(error?.localizedDescription ?? String(localized: "Decode error")))
                    return
                }
                
                completionHandler?(decodedResponse)
            }
            task.resume()
        }
    }
}

