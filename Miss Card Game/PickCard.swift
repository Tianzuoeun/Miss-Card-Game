//
//  PickCard.swift
//  Miss Card Game
//
//  Created by howardshan on 9/7/23.
//

import UIKit

class PickCard: UIViewController {
    
    lazy var imageModel = {ImageModel.shareInstance()}()
    lazy var dataPass = {DataPass.shareInstance()}()
    @IBOutlet weak var pokerImage: UIImageView!;
    
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.pokerImage.image = UIImage.init(named: "1")
        
        if dataPass.switchNum == 1 {
            playButton.isEnabled = true
        }else{
            playButton.isEnabled = false
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
}
