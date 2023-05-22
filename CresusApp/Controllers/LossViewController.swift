//
//  LossViewController.swift
//  CresusApp
//
//  Created by newAccount on 21.05.2023.
//

import UIKit

class LossViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }
    
    
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        guard let losevc = main.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else {
            return
        }
        losevc.modalPresentationStyle = .fullScreen
        present(losevc, animated: true, completion: nil)
    }
    
    
    @IBAction func repeatButtonPressed(_ sender: UIButton) {
        openLossController()
    }

    private func openLossController() {
        let main = UIStoryboard(name: "Main", bundle: nil)
        guard let losevc = main.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else {
            return
        }
        losevc.modalPresentationStyle = .fullScreen
        present(losevc, animated: true, completion: nil)
    }
    
}
