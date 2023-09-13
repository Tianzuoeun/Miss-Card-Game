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
    
  
    let data: [Int] = [2,3,4,5,6,7,8,9,10]
    
  
    
    //Set Up Player Number Label and Stepper//
    @IBOutlet weak var steplabel: UILabel!
        

    
   
    
    
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
       
        //import data
        guard let path = Bundle.main.path(forResource: "MissCardDB2nd", ofType: ".db") else {
                    fatalError("not found")
                }
                
        var db: OpaquePointer?
        
        let result = sqlite3_open(path, &db)
        
        if result != SQLITE_OK {
            print("error")
            return
        }
        
                
        // READ database and save the quantities and comments respectively in two arrays.
        
        let selectQuery = "SELECT quantity, comment FROM card_info ORDER BY id;"
        let selectQuerybp = "SELECT name FROM best_player;"
        var queryStatement1: OpaquePointer?
        var queryStatement2: OpaquePointer?
        
        
        // save the quantity of each card
        let cardNums: NSMutableArray = []

        // save the comment of each card
        let cardComments: NSMutableArray = []

        // save the name
        let bestPlayerName: NSMutableArray = []
        
        if sqlite3_prepare_v2(db, selectQuery, -1, &queryStatement1, nil) == SQLITE_OK {
                while sqlite3_step(queryStatement1) == SQLITE_ROW {
                        let num = Int(sqlite3_column_int(queryStatement1, 0))
                        cardNums.insert(num, at: 0)
                    
                 
                    
                    if let commentPointer = sqlite3_column_text(queryStatement1, 1) {
                        let comment = String(cString: commentPointer)
                        cardComments.insert(comment, at: 0)
                        
                }
            }
        }
        if sqlite3_prepare_v2(db, selectQuerybp, -1, &queryStatement2, nil) == SQLITE_OK {
                    while sqlite3_step(queryStatement2) == SQLITE_ROW {
                        if let namePointer = sqlite3_column_text(queryStatement2, 0) {
                            let name = String(cString: namePointer)
                            bestPlayerName.insert(name, at: 0)
                            
                        }
                    }
            
                }
                
        print(bestPlayerName)
        print(cardNums)
        
        self.dataPass.explaination = cardComments as! [Any]
        self.dataPass.explaination.reverse()
        self.dataPass.numQuantity = cardNums as! [Any]
        self.dataPass.numQuantity.reverse()
        self.dataPass.history = bestPlayerName
        
        




        sqlite3_finalize(queryStatement1)
        sqlite3_finalize(queryStatement2)
        sqlite3_close(db)
        
        // Do any additional setup after loading the view.
                
                
               
        //Picker Delegate//
        picker.dataSource = self
        picker.delegate = self
    }
    @IBAction func testStepper(_ sender: UIStepper) {
            steplabel.text = String(sender.value)
        self.dataPass.numQuantity[7]=Int(sender.value)
        
    }
}
//Set up Picker View Info//
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                return String(data[row])
     
    
   
        
        }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dataPass.playerNum = data[row] as NSNumber
    }
}
