//
//  OnboardingCollectionViewCell.swift
//  CresusApp
//
//  Created by newAccount on 11.05.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    func setup(model: String){
        backgroundImageView.image = UIImage(named: model)
        backgroundImageView.contentMode = .scaleToFill
    }
}
