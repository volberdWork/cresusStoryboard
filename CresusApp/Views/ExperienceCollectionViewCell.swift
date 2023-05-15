//
//  ExperienceCollectionViewCell.swift
//  CresusApp
//
//  Created by newAccount on 15.05.2023.
//

import UIKit

class ExperienceCollectionViewCell: UICollectionViewCell {
    @IBOutlet var noExperienceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        noExperienceLabel.text = "Begin your first adventure to get experience"
        noExperienceLabel.textColor = .white
        noExperienceLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 26)
    }

}
