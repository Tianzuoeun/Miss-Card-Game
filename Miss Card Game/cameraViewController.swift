//
//  cameraViewController.swift
//  Miss Card Game
//
//  Created by howardshan on 9/7/23.
//

import UIKit

class cameraViewController:
    
                                
                                
                                
                                
                                
    UIViewController, UIScrollViewDelegate {
    
    lazy private var cameraImage: UIImageView? = {
        return UIImageView.init(image: self.imageModel.getImageWithName(displayImageName))
    }()
    @IBOutlet weak var cameraScrollImage: UIScrollView!

    lazy var imageModel = {ImageModel.shareInstance()}()
    
  
    //Define the name displayed//
    
    
    var displayImageName = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        if let size = self.cameraImage?.image?.size {
            self.cameraScrollImage.addSubview(self.cameraImage!)
            self.cameraScrollImage.contentSize = size
            self.cameraScrollImage.minimumZoomScale = 0.1
            self.cameraScrollImage.delegate = self
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.cameraImage
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


