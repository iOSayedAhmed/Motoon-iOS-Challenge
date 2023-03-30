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
    var cellDataSource:Observable<[PhotoCellViewModel]> = Observable(nil)
    
    var dataSource = [PhotosModel]()
    
    // MARK: - Public methods
    
    func numberOfItemsInSection() -> Int {
        return dataSource.count
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
                self?.dataSource = data
                self?.mapCellData()
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //mapping all photosModel objects inside dataSource to my PhotoCellViewModel.
    func mapCellData(){
        self.cellDataSource.value = self.dataSource.compactMap({PhotoCellViewModel(photosModel: $0)})
    }
    
    // return Photo according its ID
    func retivePhoto(with id: String) -> PhotosModel?{
        guard let productData = dataSource.first(where: {$0.id == id}) else {return nil}
        return productData
    }
}
