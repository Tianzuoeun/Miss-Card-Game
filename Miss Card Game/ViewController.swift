//
//  ViewController.swift
//  Miss Card Game
//
//  Created by howardshan on 9/7/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    //import SwitchNum
    lazy var dataPass = {DataPass.shareInstance()}()
    var pics = 1
    // Set Up Picker View//
    @IBOutlet var picker: UIPickerView!
    
    @IBOutlet weak var funnyPic: UIImageView!
    
    
    let data = ["2","3","4","5","6","7","8","9","10"]
    
    //Set Up Player Number Label and Stepper//
    @IBOutlet weak var steplabel: UILabel!
        
    @IBAction func testStepper(_ sender: UIStepper) {
            steplabel.text = String(sender.value)
        self.dataPass.numQuantity[2]=Int(sender.value)
        
        
        }
    
   
    
    
    //Set up Switch
    
    @IBAction func playSwitch(_ sender: UISwitch) {
        if sender.isOn{
            dataPass.switchNum = 1
            
        }else{
            dataPass.switchNum = 2
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Picker Delegate//
        picker.dataSource = self
        picker.delegate = self
    }
   
        
    
}
//Set up Picker View Info//
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
}

extension ViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
}
