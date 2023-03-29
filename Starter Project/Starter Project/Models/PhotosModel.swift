//
//  PhotosModel.swift
//  Starter Project
//
//  Created by iOSayed on 29/03/2023.
//

import Foundation
// MARK: - PhotosModel
struct PhotosModel: Codable {
    let id: String
    let createdAt, updatedAt: Date
    let width, height: Int
    let color: String
    let urls: Urls
   

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case width, height, color
        case urls
    }
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}
