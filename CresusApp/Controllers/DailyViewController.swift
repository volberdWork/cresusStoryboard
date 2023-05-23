import UIKit

class DailyViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var goItButton: UIButton!
    @IBOutlet var dailyImageView: UIImageView!
    
    var rewarsBase: [RewardModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goItButton.isHidden = true
        updateRewardBase()
        configureView()
        registerCell()
        
        print(rewarsBase.count)
    }
    
    private func configureView(){
        let backImage = UIImage(named: "mainBackImage")
        backgroundImageView.image = backImage
        backgroundImageView.contentMode = .scaleToFill
        printHelloOnFirstLaunchOfDay()
        collectionView.backgroundColor = .clear
       
    }
    
    func printHelloOnFirstLaunchOfDay() {
        let userDefaults = UserDefaults.standard
        
        // Получить текущую дату
        let currentDate = Date()
        
        // Форматировать текущую дату, чтобы остались только год, месяц и день
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDateString = dateFormatter.string(from: currentDate)
        
        // Получить дату последнего запуска из UserDefaults
        let lastLaunchDate = userDefaults.string(forKey: "lastLaunchDate")
        
        // Если дата последнего запуска не совпадает с текущей датой, то это первый запуск за день
        if lastLaunchDate != currentDateString {
            // Сохранить текущую дату в UserDefaults
            userDefaults.set(currentDateString, forKey: "lastLaunchDate")
            UserProgressData.daysCount = 0
            UserProgressData.daysCount += 1
            
            dailyImageView.image = UIImage(named: "dailyImage")
            goItButton.isHidden = false
            UserProgressData.keyCount += 1
            print("Hello")
        }
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
    
    @IBAction func goItButtonPressed(_ sender: UIButton) {
        goItButton.isHidden = true
        
        dailyImageView.image = UIImage(named: "")
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
        
        let openImage = UIImage(named: "openRewardImage")
        
        if indexPath.row < UserProgressData.daysCount-1{
            cell.revardsImageView.image = openImage
        } else{
            cell.revardsImageView.image = UIImage(named: "closwRewardImage")
        }
        return cell
    }
    
    
}

extension DailyViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 5
        let height = width
        return CGSize(width: width, height: height)
    }
    
}
