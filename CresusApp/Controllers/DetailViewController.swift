import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var locationImageView: UIImageView!
    @IBOutlet var gameNameLabel: UILabel!
    
    @IBOutlet var playButton: UIButton!
    @IBOutlet var overViewLabel: UILabel!
    var detailGameInfo: [LocationModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView(){
        let backImage = UIImage(named: "mainBackImage")
        backgroundImageView.image = backImage
        backgroundImageView.contentMode = .scaleAspectFill
        
        let data = detailGameInfo.first!
        
        gameNameLabel.text = data.locationTitle
        gameNameLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 38)
        
        overViewLabel.text = data.overview
        overViewLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 22)
        
        let locationImage = UIImage(named: data.locationImage)
        locationImageView.image = locationImage
        locationImageView.contentMode = .redraw
        
        let attributedText = NSAttributedString(string: "Play", attributes: [NSAttributedString.Key.font: UIFont(name: Constants.Fonts.baseFont, size: 26)])
        playButton.setAttributedTitle(attributedText, for: .normal)
        playButton.tintColor = .white
    }
    
    private func openLoaderController() {
        let main = UIStoryboard(name: "Main", bundle: nil)
        guard let onboardingController = main.instantiateViewController(withIdentifier: "LoaderViewController") as? LoaderViewController else {
            return
        }
        onboardingController.modalPresentationStyle = .fullScreen
        present(onboardingController, animated: true, completion: nil)
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        openLoaderController()
    }
    
    
    
}
