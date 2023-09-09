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
    
    @IBOutlet weak var explaination: UILabel!
    
    
    var numQ = DataPass.shareInstance().numQuantity
    
    @IBAction func PickButton(_ sender: UIButton) {
        
        for i in 1...50{
            var ranNumber = Int.random(in: 0..<3)
            if let restNum = numQ[ranNumber] as? Int,
            (restNum>0){
                
                if let image = self.dataPass.imageName[ranNumber] as? String{
                    // Do any additional setup after loading the view.
                    self.pokerImage.image = UIImage(named: image)}
                if let expl = self.dataPass.explaination[ranNumber] as? String{
                    explaination.text = expl
                }
                numQ[ranNumber] = numQ[ranNumber] as! Int - 1
                break
            }else{
                if (i == 50){
                    explaination.text = "Game Over"
                }
                
            }
                
            }
        }
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
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
