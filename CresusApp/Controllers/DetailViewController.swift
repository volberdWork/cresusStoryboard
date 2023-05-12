import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!


    var detailGameInfo: [LocationModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
     
    }
    
    
    private func configureView(){
        let backImage = UIImage(named: "mainBackImage")
        backgroundImageView.image = backImage
        backgroundImageView.contentMode = .scaleAspectFill
    }
    


}
