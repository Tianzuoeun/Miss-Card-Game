//
//  PickCard.swift
//  Miss Card Game
//
//  Created by howardshan on 9/7/23.
//

import UIKit

class PickCard: UIViewController {
    @IBOutlet weak var pokerImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.pokerImage.image = UIImage.init(named: "1")
        
        
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
