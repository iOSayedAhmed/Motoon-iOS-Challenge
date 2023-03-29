//
//  PhotosLists + Extensions.swift
//  Starter Project
//
//  Created by iOSayed on 29/03/2023.
//

import Foundation
import UIKit

extension PhotosListVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    
    
    
    
    func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
    
    //reload CollectionView
    func reloadCollectionView(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - Collection View Data Source
    
    // returns number of items in section of collection view
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection()
    }
    
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIndintifier, for: indexPath) as! photoCollectionViewCell
         if indexPath.item < cellDataSource.count {
             cell.setupCell(viewModel: cellDataSource[indexPath.item])
         }
        
       
         return cell
     }
    
    
    
    
    // MARK: - Collection View Delegate
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    // MARK: - Collection View Delegate Flow Layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding:CGFloat = 5
        let size = collectionView.bounds.width - padding
        
        return CGSize(width: size/3, height:size/3)
    }
    // Set edge insets for each section in the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    // Set minimum line spacing between cells in each row
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // Set minimum inter-item spacing between cells in each column
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
}
