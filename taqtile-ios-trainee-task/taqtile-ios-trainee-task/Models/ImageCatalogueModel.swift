//
//  ImageCatalogueModel.swift
//  taqtile-ios-trainee-task
//
//  Created by Наталья Мазур on 26.07.24.
//

import Foundation

struct ImageCatalogueModel: Decodable {
    let hits: [Hit]
}

extension ImageCatalogueModel {
    struct Hit: Decodable, Identifiable {
        let id: Int
        let webformatURL: String
        let tags: String
        let likes: Int
        let views: Int
        let comments: Int
        let user: String
        let userImageURL: String
    }
}
