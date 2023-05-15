//
//  SettingsTableViewCell.swift
//  CresusApp
//
//  Created by newAccount on 15.05.2023.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet var settingsSwitch: UISwitch!
    @IBOutlet var buttonImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    static let reuseIdentifier = String(describing: SettingsTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 34)
        
        self.backgroundColor = .clear
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setupCell(model: SettingsList){
        buttonImage.image = UIImage(named: model.buttonImage)
        
        titleLabel.text = model.titleText
        
        if model.switchIsHidden {
            settingsSwitch.isHidden = true
        } else {
            settingsSwitch.isHidden = false
        }
        
    }
}


struct SettingsList {
    var buttonImage: String
    var titleText: String
    var switchIsHidden: Bool
    
    enum ButtonNameLabel {
        static let experience = "Experience"
        static let reminders = "Reminders"
        static let vibration = "Vibration"
        static let sound = "Sound"
        static let terms = "Terms"
        static let shareApp  = "Share App"
   }
}


extension SettingsList{
    static func getSettingsList()->[SettingsList]{
        [SettingsList(buttonImage: "settingsIconButton", titleText: SettingsList.ButtonNameLabel.experience, switchIsHidden: true),
         SettingsList(buttonImage: "", titleText: SettingsList.ButtonNameLabel.reminders, switchIsHidden: false),
         SettingsList(buttonImage: "", titleText: SettingsList.ButtonNameLabel.vibration, switchIsHidden: false),
         SettingsList(buttonImage: "", titleText: SettingsList.ButtonNameLabel.sound, switchIsHidden: false),
         SettingsList(buttonImage: "settingsIconButton", titleText: SettingsList.ButtonNameLabel.terms, switchIsHidden: true),
         SettingsList(buttonImage: "settingsIconButton", titleText: SettingsList.ButtonNameLabel.shareApp, switchIsHidden: true)
        ]
    }
}
