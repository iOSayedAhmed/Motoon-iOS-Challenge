//
//  FullScreenPhotoViewModel.swift
//  Starter Project
//
//  Created by iOSayed on 30/03/2023.
//

import Foundation

class FullScreenPhotoViewModel{
    
    
    // MARK: - Properties
    
    var id:String
    // I'm using regular url insted of full url because full Image have large Size and it will take long time to presented and I don't want use 3rd part like (SDWebImage)
    var regularPhotoUrl:String
    
    
    // MARK: - Initialization

    init(PhotosModel:PhotosModel){
        self.id = PhotosModel.id
        self.regularPhotoUrl = PhotosModel.urls.regular
    }
    
  
}

