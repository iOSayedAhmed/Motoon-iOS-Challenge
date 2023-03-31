//
//  FullScreenPhotoVC.swift
//  Starter Project
//
//  Created by iOSayed on 30/03/2023.
//

import UIKit

class FullScreenPhotoVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    // MARK: - Properties
    var viewModel:FullScreenPhotoViewModel  // ViewModel instance
    
    
    
    // MARK: - Initialization
    
    init(viewModel:FullScreenPhotoViewModel){
        self.viewModel = viewModel
        super.init(nibName: "FullScreenPhotoVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configeView()
    }
    
    // MARK: -  Methods
    
   private func configeView()  {
       self.title = "Zoom"
       scrollView.delegate = self
       self.imageView.setImageFromUrl(from: viewModel.regularPhotoUrl)
    }

  
}
extension FullScreenPhotoVC:UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    
}
