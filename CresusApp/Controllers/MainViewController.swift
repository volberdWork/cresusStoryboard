import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    //    @IBOutlet var dailyImageView: UIImageView!
    @IBOutlet var locationImageView: UIImageView!
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var dailyButton: UIButton!
    
    @IBOutlet var keyLabel: UILabel!
    var keysCount = UserProgressData.keyCount
    
    var gameBase: [LocationModel] = []
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(keysCount)
        configureView()
        
        collectionView.register(UINib(nibName: "LocationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LocationCollectionViewCell")
        collectionView.backgroundColor = .clear
        
        gameBase = [
            LocationModel(locationTitle: "Zeus Garden",
                          locationImage: "zeusImage",
                          overview: "Find all elements and get keys in time to win this adventure. Good luck!",
                          personImage: "zeusPersonImage",
                          key: 5),
            LocationModel(locationTitle: "The Golden Fleece",
                          locationImage: "goldenImage",
                          overview: "Find all elements and get keys in time to win this adventure. Good luck!",
                          personImage: "aidPersonImage",
                          key: 7),
            LocationModel(locationTitle: "Olympus Quest",
                          locationImage: "olympusImage",
                          overview: "Find all elements and get keys in time to win this adventure. Good luck!",
                          personImage: "winePersonImage",
                          key: 9),
            LocationModel(locationTitle: "Hades' Inferno",
                          locationImage: "hadesImage",
                          overview: "Find all elements and get keys in time to win this adventure. Good luck!",
                          personImage: "dinPersoneImage",
                          key: 11),
            LocationModel(locationTitle: "Odyssey of the Gods",
                          locationImage: "odyseyImage",
                          overview: "Find all elements and get keys in time to win this adventure. Good luck!",
                          personImage: "wariorPersonImage",
                          key: 13),
            LocationModel(locationTitle: "Mino's Labyrinth",
                          locationImage: "minosImage",
                          overview: "Find all elements and get keys in time to win this adventure. Good luck!",
                          personImage: "robinPersoneImage",
                          key: 15),
            LocationModel(locationTitle: "Sphinx's Riddle",
                          locationImage: "sphynxImage",
                          overview: "Find all elements and get keys in time to win this adventure. Good luck!",
                          personImage: "lovePersoneImage",
                          key: 17)
        ]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        keyLabel.text = "\(keysCount)"
//    }
    
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
        
        keyLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 19)
        keyLabel.text = "\(keysCount)"
    }
    @IBAction func dailyButtonPressed(_ sender: UIButton) {
        
    }
    
    
    
    func openDetailController(model: LocationModel) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            navigationController?.pushViewController(vc, animated: true)
            vc.detailGameInfo.append(model)
            vc.personImage = model.personImage
        }
    }
    
}

extension MainViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if keysCount >= gameBase[indexPath.row].key{
            openDetailController(model: gameBase[indexPath.row])
            UserProgressData.keyCount -= gameBase[indexPath.row].key
        }
       
        
    }
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
