import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
//    @IBOutlet var dailyImageView: UIImageView!
    @IBOutlet var locationImageView: UIImageView!
    
    @IBOutlet var dailyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView(){
        let backImage = UIImage(named: "mainBackImage")
        backgroundImageView.image = backImage
        backgroundImageView.contentMode = .scaleAspectFill
        
        let attributedText = NSAttributedString(string: "Daily Rewards", attributes: [NSAttributedString.Key.font: UIFont(name: Constants.Fonts.baseFont, size: 38)])
        dailyButton.setAttributedTitle(attributedText, for: .normal)
        dailyButton.tintColor = .white
        
        let locationImage = UIImage(named: "locationImage")
        locationImageView.image = locationImage
        locationImageView.contentMode = .scaleToFill
    }
    @IBAction func dailyButtonPressed(_ sender: UIButton) {
        
    }
    
}
