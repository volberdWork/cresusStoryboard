import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var rightPersonImageView: UIImageView!
    @IBOutlet var leftPersoneImageView: UIImageView!
    @IBOutlet var locationImageView: UIImageView!
    @IBOutlet var gameNameLabel: UILabel!
    
    @IBOutlet var playButton: UIButton!
    @IBOutlet var overViewLabel: UILabel!
    var detailGameInfo: [LocationModel] = []
    
    var personImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        checkPersone()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
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
    
    private func checkPersone(){
        switch personImage{
        
        case "zeusPersonImage" :
            let image = UIImage(named: "zeusPersonImage")
            leftPersoneImageView.image = image
        case "winePersonImage" :
            let image = UIImage(named: "")
        case "wariorPersonImage" :
            let image = UIImage(named: "wariorPersonImage")
            rightPersonImageView.image = image
        case "robinPersoneImage" :
            let image = UIImage(named: "")
        case "lovePersoneImage" :
            let image = UIImage(named: "")
        case "dinPersoneImage" :
            let image = UIImage(named: "dinPersoneImage")
            leftPersoneImageView.image = image
        case "aidPersonImage" :
            let image = UIImage(named: "aidPersonImage")
            rightPersonImageView.image = image
        default:
            return
        }
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
    
    
    @IBAction func backbuttonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
