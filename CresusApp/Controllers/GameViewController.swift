//
//  GameViewController.swift
//  CresusApp
//
//  Created by newAccount on 17.05.2023.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var winView: UIView!
    @IBOutlet var pauseKeysLabel: UILabel!
    @IBOutlet var blureView: UIVisualEffectView!
    @IBOutlet var keyProgressView: UIProgressView!
    @IBOutlet var keysLabel: UILabel!
    @IBOutlet var fifthConst: NSLayoutConstraint!
    @IBOutlet var forthConst: NSLayoutConstraint!
    @IBOutlet var thirdConst: NSLayoutConstraint!
    @IBOutlet var secondConst: NSLayoutConstraint!
    @IBOutlet var firstConst: NSLayoutConstraint!
    @IBOutlet var timeProgress: UIProgressView!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var firstImage: UIImageView!
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var lossView: UIView!
    
    var progresCount: Float = 0.0
    var incorrectSelected: Int?
    var keyCounter = 0
    var getKey = 0
    var levelGameCount = 0
    var gameBase = ["Image","Image 1","Image 2","Image 3","Image 4","Image 5","Image 6","Image 7","Image 8","Image 9","Image 10","Image 11","Image 12","Image 13","Image 14","Image 15",]
    
    var randomImages: [String] = []
    
    @IBOutlet var pauseView: UIView!
    @IBOutlet var fifthImage: UIImageView!
    @IBOutlet var forthImage: UIImageView!
    @IBOutlet var thirdImage: UIImageView!
    @IBOutlet var secondImage: UIImageView!
    
    var orintation: UIInterfaceOrientationMask = .landscape
    
    
    var isTimerRunning = true
    var timer = Timer()
    var time = 120
    var currenTime = ""
    var timeProgressCount: Float = 1.0
    var correctSelected: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        winView.isHidden = true
        lossView.isHidden = true
        pauseView.isHidden = true
        blureView.isHidden = true
        changeConstrainte()
        selectRandomElements(from: gameBase, into: &randomImages)
        configureView()
        registerCell()
        collectionView.backgroundColor = .clear
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            timerStart()
            scrollToRandomItem(collectionView: collectionView)
            timeProgress.progress = 1
            
            
        }
        configureBottomCells()
        
        
    }
    
    private func configureBottomCells(){
        fifthImage.image = UIImage(named: randomImages[4])
        secondImage.image = UIImage(named: randomImages[1])
        thirdImage.image = UIImage(named: randomImages[2])
        forthImage.image = UIImage(named: randomImages[3])
        firstImage.image = UIImage(named: randomImages[0])
        
    }
    
    private func changeConstrainte(){
        
        func first(){
            firstConst.constant = 25.0
            secondConst.constant = 0.0
            thirdConst.constant = 0.0
            forthConst.constant = 0.0
            fifthConst.constant = 0.0
        }
        
        func second(){
            firstConst.constant = 0.0
            secondConst.constant = 25
            thirdConst.constant = 0.0
            forthConst.constant = 0.0
            fifthConst.constant = 0.0
        }
        
        func third(){
            firstConst.constant = 0.0
            secondConst.constant = 0.0
            thirdConst.constant = 25.0
            forthConst.constant = 0.0
            fifthConst.constant = 0.0
        }
        
        func forth(){
            firstConst.constant = 0.0
            secondConst.constant = 0.0
            thirdConst.constant = 0.0
            forthConst.constant = 25.0
            fifthConst.constant = 0.0
        }
        
        func fifth(){
            firstConst.constant = 0.0
            secondConst.constant = 0.0
            thirdConst.constant = 0.0
            forthConst.constant = 0.0
            fifthConst.constant = 25.0
        }
        
        
        switch keyCounter{
        case 0, 5, 10, 15, 20:
            first()
        case 1, 6, 11, 16, 21 :
            second()
        case 2, 7, 12, 17, 22 :
            third()
        case 3, 8, 13, 18, 23 :
            forth()
        case 4 , 9, 14, 19, 24 :
            fifth()
        default:
            return
        }
        
    }
    
    private func openLossController() {
        
        blureView.isHidden = false
        lossView.isHidden = false
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return orintation
    }
    
    private func configureView(){
        pauseKeysLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 20)
        
        timeLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 20)
        keysLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 20)
        
    }
    
    private func registerCell(){
        let nibName = UINib(nibName: "GameCollectionViewCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "GameCollectionViewCell")
    }
    
    func selectRandomElements(from sourceArray: [String], into destinationArray: inout [String]) {
        let count = sourceArray.count
        let numberOfElementsToSelect = 5
        
        if count <= numberOfElementsToSelect {
            destinationArray = sourceArray
        } else {
            var indices = Array(0..<count)
            indices.shuffle()
            
            for i in 0..<numberOfElementsToSelect {
                let randomIndex = indices[i]
                destinationArray.append(sourceArray[randomIndex])
            }
        }
    }
    
    private func timerStart() {
        if self.isTimerRunning {
            self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
                let minutes = self.time / 60 % 60
                let seconds = self.time % 60
                self.time -= 1
                self.timeProgressCount -= (1/60)
                self.timeProgress.progress = timeProgressCount
                
                let timeString = String(format: "%01i:%02i", minutes, seconds)
                self.timerLabel.text = timeString
                self.currenTime = timeString
                
                if self.time == 0 {
                    timer.invalidate()
                    self.openLossController()
                    UserProgressData.lossCount += 1
                    print("GameLose")
                   
                }
            }
        }
    }
    
    
    func scrollToRandomItem(collectionView: UICollectionView) {
        
        // Создаем таймер для текущей коллекции
        let timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(1.5), repeats: true) { [weak self] timer in
            guard let self = self else { return }
            
            // Получаем случайный индекс элемента в массиве для текущей коллекции
            let randomIndex = Int.random(in: 0..<self.gameBase.count)
            
            // Скроллим к элементу с помощью метода scrollToItem для текущей коллекции
            collectionView.scrollToItem(at: IndexPath(item: randomIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
        
        // Запускаем таймер для текущей коллекции
        timer.fire()
    }
    
    private func openWinController() {
        blureView.isHidden = false
        winView.isHidden = false
    }
    
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        blureView.isHidden = false
        pauseView.isHidden = false
        self.timer.invalidate()
        pauseKeysLabel.text = "\(levelGameCount)"
        
    }
    
    @IBAction func pausCacelButtonPress(_ sender: UIButton) {
        blureView.isHidden = true
        pauseView.isHidden = true
        timerStart()
        
       
        
    }
    
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as? UINavigationController else {
            return
        }
        
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true)
    }
    @IBAction func reaperatButtonPressed(_ sender: UIButton) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        guard let onboardingController = main.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else {
            return
        }
        onboardingController.modalPresentationStyle = .fullScreen
        present(onboardingController, animated: true, completion: nil)
    }
    @IBAction func nextLvButtonPressed(_ sender: UIButton) {
        
        
    }
    
    @IBAction func winHomeButtonPressed(_ sender: UIButton) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as? UINavigationController else {
            return
        }
        
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true)
    }
    
    
    @IBAction func losRetryButtonPressed(_ sender: UIButton) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        guard let onboardingController = main.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else {
            return
        }
        onboardingController.modalPresentationStyle = .fullScreen
        present(onboardingController, animated: true, completion: nil)
    }
    
    @IBAction func repeatWinButtonPressed(_ sender: UIButton) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        guard let onboardingController = main.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else {
            return
        }
        onboardingController.modalPresentationStyle = .fullScreen
        present(onboardingController, animated: true, completion: nil)
    }
    
    @IBAction func lossHomeButtonPressed(_ sender: UIButton) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as? UINavigationController else {
            return
        }
        
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true)
    }
    
    
    
}

extension GameViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        if gameBase[indexPath.row] == randomImages[0] && keyCounter == 0{
            keyCounter += 1
            correctSelected = indexPath.row
        } else {
            self.incorrectSelected = indexPath.row
            
        }
        
        if gameBase[indexPath.row] == randomImages[1] && (keyCounter == 1 || keyCounter == 6 || keyCounter == 11 || keyCounter == 16 || keyCounter == 21){
            keyCounter += 1
            correctSelected = indexPath.row
            
        } else {
            self.incorrectSelected = indexPath.row
            
        }
        
        if gameBase[indexPath.row] == randomImages[2] && (keyCounter == 2 || keyCounter == 7 || keyCounter == 12 || keyCounter == 17 || keyCounter == 22){
            keyCounter += 1
            correctSelected = indexPath.row
        } else {
            self.incorrectSelected = indexPath.row
            
        }
        
        if gameBase[indexPath.row] == randomImages[3] && (keyCounter == 3 || keyCounter == 8 || keyCounter == 13 || keyCounter == 18 || keyCounter == 23){
            keyCounter += 1
            correctSelected = indexPath.row
        }
        if gameBase[indexPath.row] == randomImages[4] && (keyCounter == 4 || keyCounter == 9 || keyCounter == 14 || keyCounter == 19 || keyCounter == 24){
            keyCounter += 1
            correctSelected = indexPath.row
            keyProgressView.progress = 0
            getKey += 1
            UserProgressData.keyCount += 1
            self.progresCount += 0.2
            self.keyProgressView.progress = progresCount
            self.gameBase.shuffle()
            self.collectionView.reloadData()
            
        } else {
            self.incorrectSelected = indexPath.row
        }
        if gameBase[indexPath.row] == randomImages[0] && (keyCounter == 5 || keyCounter == 10 || keyCounter == 15 || keyCounter == 20 || keyCounter == 25){
            keyCounter += 1
            
            correctSelected = indexPath.row
        } else {
            self.incorrectSelected = indexPath.row
        }
        changeConstrainte()
        keysLabel.text = "\(getKey)/5"
        
        
        if keyCounter == 5{
           
            levelGameCount += 1
            
        }
        
        if keyCounter == 25{
            
            UserProgressData.winCount += 5
            openWinController()
        }
        collectionView.reloadData()
        print(keyCounter)
    }
    
    
    
    
}

extension GameViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameBase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCollectionViewCell", for: indexPath) as! GameCollectionViewCell
        
        
        
        
        if correctSelected == indexPath.row {
            cell.gameImageView.layer.borderWidth = 8.0
            cell.gameImageView.layer.borderColor = CGColor(red: 77/255, green: 184/255, blue: 67/255, alpha: 1)
        } else if correctSelected != indexPath.row || incorrectSelected != indexPath.row{
            cell.gameImageView.layer.borderWidth = 0.0
        } else if incorrectSelected == indexPath.row{
            cell.gameImageView.layer.borderWidth = 8.0
            cell.gameImageView.layer.borderColor = CGColor(red: 3/255, green: 3/255, blue: 3/255, alpha: 1)
        }
        
        
        
        
        
        cell.gameImageView.image = UIImage(named: gameBase[indexPath.row])
        
        return cell
    }
    
    
}


extension GameViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 11
        
        return CGSize(width: width, height: width)
    }
    
}
