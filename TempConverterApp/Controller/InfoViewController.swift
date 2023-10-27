//
//  InfoViewController.swift
//  TempConverterApp
//
//  Created by Anastasiya Omak on 26/10/2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var info: String?
    var desc: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let info = info, let desc = desc {
            infoLabel.text = info
            descLabel.text = desc
        }
    }
}


