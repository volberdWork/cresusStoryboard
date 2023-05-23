import UIKit

class LocationCollectionViewCell: UICollectionViewCell {

    @IBOutlet var location: UILabel!

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
        
 
    }

    
    func setupCell(model: LocationModel){
        location.text = model.locationTitle
        
        let image = UIImage(named: model.locationImage)
        locationImageView.image = image
        
        if model.key > UserProgressData.keyCount{
            locationImageView.alpha = 0.3
            keyView.isHidden = false
            keyLabel.text = "\(model.key)"
            
        } else if model.key <= UserProgressData.keyCount{
            keyView.isHidden = true
            locationImageView.alpha = 1
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
