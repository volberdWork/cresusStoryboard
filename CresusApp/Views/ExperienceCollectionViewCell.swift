//
//  ExperienceCollectionViewCell.swift
//  CresusApp
//
//  Created by newAccount on 15.05.2023.
//

import UIKit

class ExperienceCollectionViewCell: UICollectionViewCell {
    @IBOutlet var expirienceView: UIView!
    @IBOutlet var noExperienceLabel: UILabel!
    
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var locationImageView: UIImageView!
    @IBOutlet var winCountLabel: UILabel!
    @IBOutlet var lostCountLabel: UILabel!
    @IBOutlet var totalCountLabel: UILabel!
    @IBOutlet var winLabel: UILabel!
    @IBOutlet var lostLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        totalLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 18)
        lostLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 18)
        winLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 18)
        
        totalCountLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 14)
        lostCountLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 14)
        winCountLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 14)
        
        locationLabel.text = "Zeus Garden"
        locationLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 32)
        
        locationLabel.textColor = .white
        
        expirienceView.isHidden = true
        
        noExperienceLabel.text = "Begin your first adventure to get experience"
        noExperienceLabel.textColor = .white
        noExperienceLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 26)
        
        totalCountLabel.text = "\(UserProgressData.lossCount + UserProgressData.winCount)"
        winCountLabel.text = "\(UserProgressData.winCount)"
        lostCountLabel.text = "\(UserProgressData.lossCount)"
        locationImageView.image = UIImage(named: "zeusImage")
    }
}
