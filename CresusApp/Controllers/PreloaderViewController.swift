import UIKit

class PreloaderViewController: UIViewController {
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var label: UILabel!
    @IBOutlet var logoImageViewv: UIImageView!
    @IBOutlet var thirdLoadImageView: UIImageView!
    @IBOutlet var secondLoadImageView: UIImageView!
    @IBOutlet var firstLoadImageView: UIImageView!
    let firstRun = UserDefaults.standard.bool(forKey: "firstRun") as Bool
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if firstRun {
            //function you want to run normally
        } else {
            runFirst() //will only run once
        }
        
        
        configureView()
        loadinImages()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) { // Открываем второй контроллер через 1.5 секунды
            self.openSecondController()
        }
    }
    func runFirst() {
        print("FIRST RUN!")
        UserProgressData.keyCount += 4
        UserDefaults.standard.set(true, forKey: "firstRun")
    }
    
    
    
    private func openSecondController() {
        let main = UIStoryboard(name: "Main", bundle: nil)
        guard let onboardingController = main.instantiateViewController(withIdentifier: "OnboardingViewController") as? OnboardingViewController else {
            return
        }
        onboardingController.modalPresentationStyle = .fullScreen
        present(onboardingController, animated: true, completion: nil)
    }
    
    private func configureView(){
        let backgroundImage = UIImage(named: "backgroundPreloaderImage")
        
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleToFill
        
        let logoImage = UIImage(named: "logoImageView")
        logoImageViewv.image = logoImage
        
        let loadingImage = UIImage(named: "loadingImage")
        firstLoadImageView.image = loadingImage
        secondLoadImageView.image = loadingImage
        thirdLoadImageView.image = loadingImage
        
        firstLoadImageView.alpha = 1
        secondLoadImageView.alpha = 0.5
        thirdLoadImageView.alpha = 0.3
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
