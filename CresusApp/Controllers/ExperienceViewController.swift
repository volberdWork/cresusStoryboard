import UIKit

class ExperienceViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = UINib(nibName: "ExperienceCollectionViewCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "ExperienceCollectionViewCell")
        
        collectionView.backgroundColor = .clear
        
    }
    


}

extension ExperienceViewController: UICollectionViewDelegate{
    
}


extension ExperienceViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExperienceCollectionViewCell", for: indexPath) as! ExperienceCollectionViewCell
        
        return cell
    }
    
    
}


extension ExperienceViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 32 // Left and right insets
        let height: CGFloat = 494
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
