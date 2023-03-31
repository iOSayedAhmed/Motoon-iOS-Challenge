//
//  PhotosList.swift
//  Starter Project
//
//  Created by Ahmed M. Hassan on 26/03/2023.
//

import UIKit

class PhotosListVC: UIViewController,UIViewControllerTransitioningDelegate {
    
    //MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var activityIndecator: UIActivityIndicatorView!
    // MARK: - Properties
    let zoomAnimator = ZoomAnimator()

    let cellIndintifier = "photoCollectionViewCell"
    
    var cellDataSource = [PhotoCellViewModel]()
    // ViewModel instance
    var viewModel:PhotosListsViewModel = PhotosListsViewModel()
    
    
    
    //MARK: View Lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
    }
    
    
    

    //MARK: Methods
    private func configureView(){
        customizeNavigationController()
        setupCollectionView()
        viewModel.fetchPhotos()
        viewModelBinding()
    }
    
    
    // Bind view model data to UI elements
    private  func viewModelBinding(){
        
        //bind isLoading to handle Loader Animating
        viewModel.isLoading.bind {[weak self] isLoading in
            guard let self = self , let isLoading = isLoading else{return}
            
            DispatchQueue.main.async {
                isLoading ? self.activityIndecator.startAnimating() : self.activityIndecator.stopAnimating()
            }
            
        }
        
        // Bind cellDataSource to update collection view
          viewModel.cellDataSource.bind {[weak self] photos in
              guard let self = self , let PhotoCellViewModels = photos else{return}
              print("hjk",PhotoCellViewModels.count)
              self.cellDataSource = PhotoCellViewModels
              self.reloadCollectionView()
          }
    }

    
    // Navigate to Full Screen Photo  view .
   func goToDetailsView(productID:String){
       guard let photoModel =  viewModel.retivePhoto(with: productID)else{return}
       let fullScreenPhotoVM = FullScreenPhotoViewModel(PhotosModel: photoModel)
       let fullScreenPhotoVC = FullScreenPhotoVC(viewModel: fullScreenPhotoVM)
//       fullScreenPhotoVC.transitioningDelegate = zoomAnimator
//
//       present(fullScreenPhotoVC, animated: true, completion: nil)
//      // fullScreenPhotoVC.modalTransitionStyle = .partialCurl
       self.navigationController?.pushViewController(fullScreenPhotoVC, animated: true)
   }
}

