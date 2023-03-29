//
//  PhotosList.swift
//  Starter Project
//
//  Created by Ahmed M. Hassan on 26/03/2023.
//

import UIKit

class PhotosListVC: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    // ViewModel instance
    var viewModel:PhotosListsViewModel = PhotosListsViewModel()
    
    
    
    //MARK: View Lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }

    //MARK: Methods
    private func configureView(){
        
    }

}

