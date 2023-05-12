import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var backgroundImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView(){
        let backImage = UIImage(named: "mainBackImage")
        backgroundImageView.image = backImage
        backgroundImageView.contentMode = .scaleToFill
    }


    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
