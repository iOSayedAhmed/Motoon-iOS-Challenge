//
//  photoCollectionViewCell.swift
//  Starter Project
//
//  Created by iOSayed on 29/03/2023.
//

import UIKit

class photoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
     func setupCell(viewModel:PhotoCellViewModel) {
        self.imageView.setImageFromUrl(from: viewModel.thumbUrl)
    }
}
