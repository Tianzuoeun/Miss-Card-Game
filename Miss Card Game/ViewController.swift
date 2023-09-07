//
//  ViewController.swift
//  Miss Card Game
//
//  Created by howardshan on 9/7/23.
//

import UIKit


class ViewController: UIViewController {
    
    
    
    // Set Up Picker View//
    @IBOutlet var picker: UIPickerView!
    
    let data = ["2","3","4","5","6","7","8","9","10"]
    
    //Set Up Player Number Label and Stepper//
    @IBOutlet weak var steplabel: UILabel!
        
    @IBAction func testStepper(_ sender: UIStepper) {
            steplabel.text = String(sender.value)
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
