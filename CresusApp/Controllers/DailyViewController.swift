import UIKit

class DailyViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var backgroundImageView: UIImageView!
    
    var rewarsBase: [RewardModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateRewardBase()
        configureView()
        registerCell()
        
        print(rewarsBase.count)
    }
    
    private func configureView(){
        let backImage = UIImage(named: "mainBackImage")
        backgroundImageView.image = backImage
        backgroundImageView.contentMode = .scaleToFill
       
        collectionView.backgroundColor = .clear
       
    }
    
    private func updateRewardBase(){
        for i in 0...99{
            rewarsBase.append(RewardModel(days: i))
        }
    }
    
    private func registerCell(){
        let nibName = UINib(nibName: "RewardsCollectionViewCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "RewardsCollectionViewCell")
    }
    

    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension DailyViewController: UICollectionViewDelegate{
    
}

extension DailyViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RewardsCollectionViewCell", for: indexPath) as! RewardsCollectionViewCell
        
        cell.setupCell(model: rewarsBase[indexPath.row])
        return cell
    }
    
    
}

extension DailyViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 5
        let height: CGFloat = 81
        return CGSize(width: width, height: height)
    }
    
}
