//
//  GameViewController.swift
//  CresusApp
//
//  Created by newAccount on 17.05.2023.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var firstImage: UIImageView!
    @IBOutlet var timeLabel: UILabel!
    var gameBase = ["Image","Image 1","Image 2","Image 3","Image 4","Image 5","Image 6","Image 7","Image 8","Image 9","Image 10","Image 11","Image 12","Image 13","Image 14","Image 15",]
    
    var randomImages: [String] = []
    
    @IBOutlet var fifthImage: UIImageView!
    @IBOutlet var forthImage: UIImageView!
    @IBOutlet var thirdImage: UIImageView!
    @IBOutlet var secondImage: UIImageView!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectRandomElements(from: gameBase, into: &randomImages)
        
        configureView()
        
        registerCell()
        
        collectionView.backgroundColor = .clear
        scrollToRandomItem(collectionView: collectionView)
        
        fifthImage.image = UIImage(named: randomImages[0])
        secondImage.image = UIImage(named: randomImages[1])
        thirdImage.image = UIImage(named: randomImages[2])
        forthImage.image = UIImage(named: randomImages[3])
        firstImage.image = UIImage(named: randomImages[4])
        
         
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    
    private func configureView(){
        timeLabel.font = UIFont(name: Constants.Fonts.baseFont, size: 20)
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

}



extension GameViewController: UICollectionViewDelegate{
    
}

extension GameViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameBase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCollectionViewCell", for: indexPath) as! GameCollectionViewCell
        
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
