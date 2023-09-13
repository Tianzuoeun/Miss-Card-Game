//
//  ReviewViewController.swift
//  Miss Card Game
//
//  Created by howardshan on 9/7/23.
//

import UIKit

class ReviewViewController: UIViewController, UITextFieldDelegate {
    
    lazy var dataPass = {DataPass.shareInstance()}()
    var tempList: NSMutableArray = []
    @IBOutlet weak var bestPlayerTextField: UITextField!
    
    @IBOutlet weak var historyList: UILabel!{
        
        
        didSet{
            if (self.dataPass.history.count < 5){
                historyList.text = self.dataPass.history.componentsJoined(by: " , ")}
            else {
                let count = [4,3,2,1,0]
                for n in count{
                    tempList.insert(self.dataPass.history[n],at: 0)
                    
                }
                historyList.text = tempList.componentsJoined(by: " , ")}
            
        }
    }
    
    
    @IBOutlet weak var rateScore: UILabel!
    
    @IBAction func history(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            historyList.isHidden = false
        case 1:
            historyList.isHidden = true
        default:
            historyList.isHidden = false
        }
    }
    @IBAction func rateSlicer(_ sender: UISlider) {
        rateScore.text = String(floor(sender.value))
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.bestPlayerTextField.resignFirstResponder()
        return true
    }
    
    
    var db: OpaquePointer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        bestPlayerTextField.delegate = self
        
        
    }
    
    @IBAction func submitReview() {
        if let addContent = self.bestPlayerTextField.text{
            
            
            self.dataPass.history.insert(addContent, at: 0)
            if (self.dataPass.history.count < 5){
                historyList.text = self.dataPass.history.componentsJoined(by: " , ")}
            else {
                if (tempList.count == 0 ){
                    let count = 0...4
                    for n in count{
                        
                        tempList.insert(self.dataPass.history[n],at: 0)
                        
                    }
                }
                tempList.removeAllObjects()
                let count = [4,3,2,1,0]
                for n in count{
                    
                    tempList.insert(self.dataPass.history[n],at: 0)
                    
                }
                historyList.text = tempList.componentsJoined(by: " , ")}
            
            
            // recceive the path
            guard let dbPath = Bundle.main.path(forResource: "MissCardDB2nd", ofType: ".db") else {
                print("Unable to find .db file.")
                return
            }
            
            // open database
            if sqlite3_open(dbPath, &db) != SQLITE_OK {
                print("Error opening database.")
                return
            }
            
            // Excute Updating
            let insertQuery = "INSERT INTO best_player (name) VALUES ('\(addContent)')"
            
            var updateStatement: OpaquePointer?
            
            if sqlite3_prepare_v2(db, insertQuery, -1, &updateStatement, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("Error preparing insert: \(errmsg)")
                return
            }
            
            if sqlite3_step(updateStatement) != SQLITE_DONE {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("Failure inserting data: \(errmsg)")
                return
            }
            
            sqlite3_finalize(updateStatement)
            
            print("Insert succeeded.")
            
            
            sqlite3_close(db)
            self.bestPlayerTextField.resignFirstResponder()
            
            // NEED A CONNECT TO DATABASE
        }}
    
    
    
    
    
    @IBAction func tapDidCancel(_ sender: UITapGestureRecognizer) {
        
        
        self.bestPlayerTextField.resignFirstResponder()
        
        
        
        
    }
    
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
