import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var tablaView: UITableView!
    @IBOutlet var backgroundImageView: UIImageView!
    
    var settingsList = SettingsList.getSettingsList()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView(){
        let backImage = UIImage(named: "mainBackImage")
        backgroundImageView.image = backImage
        backgroundImageView.contentMode = .scaleToFill
        
        tablaView.backgroundColor = .clear
        tablaView.register(UINib(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: SettingsTableViewCell.reuseIdentifier)
    }
    
    func openexperienceController() {
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "ExperienceViewController") as? ExperienceViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    func openTermsController() {
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "TermsViewController") as? TermsViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension SettingsViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedButton = indexPath.row
        
        switch selectedButton {
        case 0:
            print("Experience")
            openexperienceController()
        case 1:
            print("Reminders")
        case 2:
            print("vibration")

        case 3:
            print("Sound")

        case 4 :
            print("Terms")
            openTermsController()

        case 5 :
            print("Share App")
            let textToShare = "Awesome app Estrela"
            if let urlStr = NSURL(string: "https://apps.apple.com") {
                let objectsToShare = [textToShare, urlStr] as [Any]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                activityVC.popoverPresentationController?.sourceView = self.view
                self.present(activityVC, animated: true, completion: nil)
            }
        default:
            return
        }
    }
    
}

extension SettingsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.reuseIdentifier, for: indexPath) as! SettingsTableViewCell
        
        cell.setupCell(model: settingsList[indexPath.row])
        
        cell.selectionStyle = .none
        return cell
    }
    
    
}
