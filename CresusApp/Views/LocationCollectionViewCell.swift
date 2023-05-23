import UIKit

class LocationCollectionViewCell: UICollectionViewCell {

    @IBOutlet var location: UILabel!
    
    @IBOutlet var darkView: UIView!
    @IBOutlet var keyLabel: UILabel!
    @IBOutlet var keyView: UIView!
    @IBOutlet var locationImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        location.font = UIFont(name: Constants.Fonts.baseFont, size: 32)
        
        locationImageView.contentMode = .scaleAspectFill
        
        keyLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 26)
        keyView.isHidden = true
        keyLabel.textColor = .white
        
        darkView.backgroundColor = .black
        darkView.alpha = 0.4
    }

    
    func setupCell(model: LocationModel){
        location.text = model.locationTitle
        
        let image = UIImage(named: model.locationImage)
        locationImageView.image = image
        
        if UserProgressData.keyCount < model.key{
            keyView.isHidden = false
            keyLabel.text = "\(model.key)"
            print(UserProgressData.keyCount)
            print(model.key)
            darkView.isHidden = false
        } else{
            keyView.isHidden = true
            darkView.isHidden = true
            
        }
    }
}

struct LocationModel{
    var locationTitle: String
    var locationImage: String
    var overview: String
    var personImage: String
    var key: Int
}
