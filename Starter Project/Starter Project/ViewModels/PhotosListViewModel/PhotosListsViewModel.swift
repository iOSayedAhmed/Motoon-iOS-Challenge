//
//  PhotosListsViewModel.swift
//  Starter Project
//
//  Created by iOSayed on 29/03/2023.
//

import Foundation

class PhotosListsViewModel {
    
    
    // MARK: - Properties
    
    var isLoading:Observable<Bool> = Observable(false)
    
    
    // MARK: - Public methods
    
    func numberOfItemsInSection() -> Int {
        return 0
    }
    
    
    
    
    // Fetch Photos from API
    func fetchPhotos() {
        guard let url = URL(string: NetworkConstants.shared.baseUrl + NetworkConstants.shared.key)else{return}
        if isLoading.value ?? true {
            return
        }
        print("fetchPhotos")
        URLSession.shared.request(url:url , expecting: [PhotosModel].self) { [weak self] results in
            self?.isLoading.value = false
            switch results {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
