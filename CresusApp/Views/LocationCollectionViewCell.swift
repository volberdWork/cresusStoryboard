import UIKit

class LocationCollectionViewCell: UICollectionViewCell {

    @IBOutlet var location: UILabel!
    
    @IBOutlet var locationImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        location.font = UIFont(name: Constants.Fonts.baseFont, size: 32)
        
        locationImageView.contentMode = .scaleAspectFill
    }

    
    func setupCell(model: LocationModel){
        location.text = model.locationTitle
        
        let image = UIImage(named: model.locationImage)
        locationImageView.image = image
        
    }
}

struct LocationModel{
    var locationTitle: String
    var locationImage: String
    var overview: String
    var personImage: String
}
