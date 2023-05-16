//
//  RewardsCollectionViewCell.swift
//  CresusApp
//
//  Created by newAccount on 16.05.2023.
//

import UIKit

class RewardsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var revardsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        
       let ravrdImage = UIImage(named: "closwRewardImage")
        revardsImageView.image = ravrdImage
        
        dayLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 22)
        dayLabel.textColor = .white
    }
    
    func setupCell(model: RewardModel){
        
        dayLabel.text = "Day \(model.days + 1)"
    }

}

struct RewardModel{
    var days: Int
}
