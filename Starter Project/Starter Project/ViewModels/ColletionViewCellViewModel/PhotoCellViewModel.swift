//
//  PhotoCellViewModel.swift
//  Starter Project
//
//  Created by iOSayed on 29/03/2023.
//

import Foundation

class PhotoCellViewModel {
    
    var id:String
    var thumbUrl:String
    var fullUrl:String
    
    //MARK: Initializer
    init(photosModel:PhotosModel) {
        self.id = photosModel.id
        self.thumbUrl = photosModel.urls.thumb
        self.fullUrl = photosModel.urls.full
    }
}
