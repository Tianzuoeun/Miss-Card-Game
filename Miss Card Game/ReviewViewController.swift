//
//  ReviewViewController.swift
//  Miss Card Game
//
//  Created by howardshan on 9/7/23.
//

import UIKit

class ReviewViewController: UIViewController, UITextFieldDelegate {
    
    lazy var dataPass = {DataPass.shareInstance()}()
    
    @IBOutlet weak var bestPlayerTextField: UITextField!
    
    @IBOutlet weak var historyList: UILabel!
    
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
        rateScore.text = String(sender.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        bestPlayerTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.bestPlayerTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func submitReview() {
        var bestPlayerToDisplay = " "
        
        bestPlayerToDisplay = "The last best player is  \(String(describing: self.bestPlayerTextField.text))"
        
        self.historyList.text = bestPlayerToDisplay
        
        self.bestPlayerTextField.resignFirstResponder()
        
        // NEED A CONNECT TO DATABASE
        
    }

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
