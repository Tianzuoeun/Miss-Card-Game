//
//  PlayCamViewController.swift
//  Miss Card Game
//
//  Created by howardshan on 9/7/23.
//

import UIKit

class PlayCamViewController: UIViewController {
    
    lazy var imageModel = {ImageModel.shareInstance()}()
    
    @IBOutlet weak var PlayCamImageView: UIImageView!
    
    
    var picIndex:Int = 0
    
    
    @IBOutlet weak var coLabel: UILabel!
    override func viewDidLoad() {
        //use imageArray instead of drag from imageModel
        
        
        
        let name = self.imageModel.cameraImageNames[picIndex]
        
        
        
        
        //
        
        super.viewDidLoad()
        let timer = Timer.scheduledTimer(timeInterval: 5,
                                         target: self,
                                         selector: #selector(showpic),
                                         userInfo: nil,
                                         repeats: true)
            
           
            
            
    }
            
            
        @objc func showpic(){
            if picIndex < self.imageModel.cameraImageNames.count{
                if let  imageName = self.imageModel.cameraImageNames[picIndex] as? String{
                self.PlayCamImageView.image = UIImage(named: imageName)
                
                    picIndex = picIndex + 1
                    coLabel.text = String(picIndex)
                }else{
                    
                }
            }else{ picIndex = 0
                if let  imageName = self.imageModel.cameraImageNames[picIndex] as? String{
                self.PlayCamImageView.image = UIImage(named: imageName)
                
                    picIndex = picIndex + 1
                    
                }else{
                    
                }
            
        }
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
