//
//  GameViewController.swift
//  CresusApp
//
//  Created by newAccount on 17.05.2023.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    var gameBase = ["Image","Image 1","Image 2","Image 3","Image 4","Image 5","Image 6","Image 7","Image 8","Image 9","Image 10","Image 11","Image 12","Image 13","Image 14","Image 15",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        
        collectionView.backgroundColor = .clear
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    private func registerCell(){
        let nibName = UINib(nibName: "GameCollectionViewCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "GameCollectionViewCell")
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
        let width = collectionView.frame.size.width / 10
        
        return CGSize(width: width, height: width)
    }
    
}
