//
//  ViewController.swift
//  HW3_a
//
//  Created by Jemima Turnbull on 5/15/19.
//  Copyright © 2019 Jemima Turnbull. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DistanceSelectionViewControllerDelegate{

    @IBOutlet weak var LatP1: UITextField!
    
    @IBOutlet weak var LatP2: UITextField!
    
    @IBOutlet weak var LongP1: UITextField!
    
    @IBOutlet weak var LongP2: UITextField!
    
    @IBOutlet weak var DistanceTextField: UITextField!
    
    
    @IBOutlet weak var BearingTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dissmissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
        
        self.LatP1.delegate = self
        self.LatP2.delegate = self
        self.LongP1.delegate = self
    }
    
    @objc func dissmissKeyboard(){
        self.view.endEditing(true)
    }
    
    func checkInput() -> Bool {
        var OK = false
        if LatP1.text != "" {
            OK = true
        }
        return OK
        
    }
    
    func indicateSelection(distance: String) {
        self.DistanceTextField.text = distance
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewSettingsSegue" {
            if let nc = segue.destination as? UINavigationController {
                if let dest = nc.children[0] as? SettingsViewController {
                    dest.delegate = self
                }
                
            }
            
            }
        }
    
    
    @IBAction func CalcTapped(_ sender: UIButton) {
        if self.checkInput(){
            DistanceTextField.text = LatP1.text
        }
        else {
            print("You have not entered a value!")
        }
    }
    

    

    @IBAction func ClearTapped(_ sender: UIButton) {
        LatP1.text = ""
        LatP2.text = ""
        LongP1.text = ""
        LongP2.text = ""
        DistanceTextField.text = ""
    }
    
    
}

extension ViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        if textField == self.LatP1 {
            self.LongP1.becomeFirstResponder()
        }
        else if textField == self.LongP1{
            self.LatP2.becomeFirstResponder()
        }
        else {
            self.LongP2.becomeFirstResponder()
        }
        

        
        
        return true
    }
    
    
}

