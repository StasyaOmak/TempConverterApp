//
//  AppearenceViewController.swift
//  TempConverterApp
//
//  Created by Anastasiya Omak on 26/10/2023.
//

import UIKit

class AppearenceViewController: UIViewController {

    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabelText()

    }
    
    @IBAction func closeItemTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func openSettings(_ sender: Any) {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
    
    func setLabelText() {
        textLabel.text = self.traitCollection.userInterfaceStyle == .dark ? "Dark Mode is On" : "Light Mode is On"
        }
    }


extension AppearenceViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}
