//
//  PokerViewController.swift
//  Miss Card Game
//
//  Created by howardshan on 9/12/23.
//

import UIKit

class PokerViewController:  UIViewController, UIScrollViewDelegate {
    
    lazy private var pokerImage: UIImageView? = {
        return UIImageView.init(image: self.imageModel.getImageWithName(displayImageName))
    }()
    @IBOutlet weak var pokerScrollImage: UIScrollView!

    lazy var imageModel = {ImageModel.shareInstance()}()
    lazy var dataPass = {DataPass.shareInstance()}()
    
  
    //Define the name displayed//
    
    
    var displayImageName = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        if let size = self.pokerImage?.image?.size {
            self.pokerScrollImage.addSubview(self.pokerImage!)
            self.pokerScrollImage.contentSize = size
            self.pokerScrollImage.minimumZoomScale = 0.1
            self.pokerScrollImage.delegate = self
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.pokerImage
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


