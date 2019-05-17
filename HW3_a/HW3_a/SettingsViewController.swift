//
//  SettingsViewController.swift
//  HW3_a
//
//  Created by Reuben B. Nyenhuis on 5/16/19.
//  Copyright © 2019 Jemima Turnbull. All rights reserved.
//

import UIKit


protocol DistanceSelectionViewControllerDelegate {
    func indicateSelection(distance: String)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var DistanceUnitsPicker: UIPickerView!
    var pickerData: [String] = [String]()
    var selection : String = "Kilometers"
    var delegate : DistanceSelectionViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerData = ["Kilometers", "Miles"]
        self.DistanceUnitsPicker.delegate = self
        self.DistanceUnitsPicker.dataSource = self
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func SavePressed(_ sender: UIBarButtonItem) {
        if let d = self.delegate {
            d.indicateSelection(distance: selection)
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    

    
    
    
    @IBAction func CancelPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
   
}

extension SettingsViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    // The number of columns of data
    func numberOfComponents(in: UIPickerView) -> Int
    {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return self.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        self.selection = self.pickerData[row]
    }
}
