import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet var nextButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    let buttonText = ["Next","Next","Join the Adventure"]
    let backgroundImages = ["firstImage","secondImage","thirdImage"]
    var currentCellIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.isPagingEnabled = true
        currentCellIndex = 0
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
      
    }
    
    private func configureView(){
        let attributedText = NSAttributedString(string: buttonText.first!, attributes: [NSAttributedString.Key.font: UIFont(name: Constants.Fonts.baseFont, size: 26)])
        nextButton.setAttributedTitle(attributedText, for: .normal)
        nextButton.tintColor = .white
        
    }
    
    private func openSecondController() {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as? UINavigationController else {
            return
        }
        
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true)
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if currentCellIndex < 3{
            currentCellIndex += 1
            if currentCellIndex == 2{
                let attributedText = NSAttributedString(string: buttonText.last!, attributes: [NSAttributedString.Key.font: UIFont(name: Constants.Fonts.baseFont, size: 26)])
                nextButton.setAttributedTitle(attributedText, for: .normal)
            }
        }
        
        if currentCellIndex < 3{
            let indexPath = IndexPath(row: currentCellIndex, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        } else{
          openSecondController()
        }
        MakeVibration().makeVibration()
        
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate{
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollView.contentInsetAdjustmentBehavior = .never
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollView.contentInsetAdjustmentBehavior = .automatic
    }
}


extension OnboardingViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return backgroundImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(model: self.backgroundImages[indexPath.row])
        return cell
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

