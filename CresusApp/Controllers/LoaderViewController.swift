//
//  LoaderViewController.swift
//  CresusApp
//
//  Created by newAccount on 16.05.2023.
//

import UIKit

class LoaderViewController: UIViewController {
    @IBOutlet var firstLoadImageView: UIImageView!
    
    @IBOutlet var thirdLoadImageView: UIImageView!
    @IBOutlet var secondLoadImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstLoadImageView.alpha = 1
        secondLoadImageView.alpha = 0.5
        thirdLoadImageView.alpha = 0.3
        
        loadinImages()
        
    }
    
    
    private func loadinImages(){
        UIView.animate(withDuration: 1.0, delay: 0.3, options: [.autoreverse, .repeat], animations: {
            self.firstLoadImageView.alpha = 0.0 // скрываем второе изображение
            self.firstLoadImageView.alpha = 1.0 // показываем второе изображение снова
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.6, options: [.autoreverse, .repeat], animations: {
            self.secondLoadImageView.alpha = 0.0 // скрываем второе изображение
            self.secondLoadImageView.alpha = 0.5 // показываем второе изображение снова
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 1.0, options: [.autoreverse, .repeat], animations: {
            self.thirdLoadImageView.alpha = 0.0 // скрываем второе изображение
            self.thirdLoadImageView.alpha = 0.3 // показываем второе изображение снова
        }, completion: nil)
    }
    
}
