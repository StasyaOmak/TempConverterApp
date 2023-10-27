//
//  ViewController.swift
//  TempConverterApp
//
//  Created by Anastasiya Omak on 26/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var convertedTempLabel: UILabel!
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var tempSlider: UISlider! {
        didSet {
            tempSlider.value = 0
            tempSlider.minimumValue = 0
            tempSlider.maximumValue = 100
        }
    }
    @IBOutlet weak var tempSegmentControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        convertedTempLabel.text = "32 ºF"
    }
    
    @IBAction func sliderValueChange(_ sender: Any) {
        updateTempLabelFromSlider(value: tempSlider.value)
    }
    
    @IBAction func segmentValueChange(_ sender: Any) {
        updateTempLabelFromSlider(value: tempSlider.value)
    }
    
    
#warning("pass result to Info VC without segue ")
    
    @IBAction func infoButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let infoScreen = storyboard.instantiateViewController(withIdentifier: "InfoViewController") as? InfoViewController else { return }
        
        infoScreen.info = "Current Temperature"
        infoScreen.desc = "\(celsiusLabel.text ?? "") or \(convertedTempLabel.text ?? "")"
        
        self.navigationController?.pushViewController(infoScreen, animated: true)
    }
    
    
    
    func updateTempLabelFromSlider(value: Float) {
        
        let celsiusTemp = Int(tempSlider.value)
        celsiusLabel.text = "\(celsiusTemp) ºC"
        
        let (fahrenheit, kelvin) = convertTempFrom(celsius: celsiusTemp)
        let selectedSegmentIndex = tempSegmentControl.selectedSegmentIndex
        
        let temperatureText: String
        if selectedSegmentIndex == 0 {
            temperatureText = "\(fahrenheit) ºF"
        } else {
            temperatureText = "\(kelvin) ºK"
        }
        convertedTempLabel.text = temperatureText
    }
    
    
    func convertTempFrom(celsius: Int) -> (fahrenheit: Double, kelvin: Double) {
        let tempFahrenheit = Double(celsius) * 9 / 5 + 32
        let tempKelvins = Double(celsius) + 273.15
        return (tempFahrenheit, tempKelvins)
    }
}
