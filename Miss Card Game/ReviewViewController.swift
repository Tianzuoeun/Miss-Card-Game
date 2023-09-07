//
//  ReviewViewController.swift
//  Miss Card Game
//
//  Created by howardshan on 9/7/23.
//

import UIKit

class ReviewViewController: UIViewController {

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
