import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
//    @IBOutlet var dailyImageView: UIImageView!
    @IBOutlet var locationImageView: UIImageView!
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var dailyButton: UIButton!
    
    var gameBase: [LocationModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        collectionView.register(UINib(nibName: "LocationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LocationCollectionViewCell")
        collectionView.backgroundColor = .clear
        
        gameBase = [
            LocationModel(locationTitle: "Zeus Garden", locationImage: "zeusImage"),
            LocationModel(locationTitle: "The Golden Fleece", locationImage: "goldenImage"),
            LocationModel(locationTitle: "Olympus Quest", locationImage: "olympusImage"),
            LocationModel(locationTitle: "Hades' Inferno", locationImage: "hadesImage"),
            LocationModel(locationTitle: "Odyssey of the Gods", locationImage: "odyseyImage"),
            LocationModel(locationTitle: "Mino's Labyrinth", locationImage: "minosImage"),
            LocationModel(locationTitle: "Sphinx's Riddle", locationImage: "sphynxImage")
        ]
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

extension MainViewController: UICollectionViewDelegate{
    
}

extension MainViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameBase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocationCollectionViewCell", for: indexPath) as! LocationCollectionViewCell
        
        cell.setupCell(model: gameBase[indexPath.row])
        return cell
    }
    
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 16
        let height = 260.0
        return CGSize(width: width, height: height)
    }
}
