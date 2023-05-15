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


    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension SettingsViewController: UITableViewDelegate{
    
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
