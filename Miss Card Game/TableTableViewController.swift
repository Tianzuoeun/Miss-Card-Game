//
//  TableTableViewController.swift
//  Miss Card Game
//
//  Created by howardshan on 9/7/23.
//

import UIKit

class TableTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    lazy var imageModel: ImageModel = {
        return ImageModel.shareInstance()
        
    }()
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            
            return imageModel.cameraImageNames.count
        }else{
            return 1
        }
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageNameCell", for: indexPath)
            
            // Configure the cell...
            if let name = self.imageModel.cameraImageNames[indexPath.row] as? String{
                
                cell.textLabel!.text = name
            }
            return cell
        }else{let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCell", for: indexPath)
            cell.textLabel?.text = "All Image"
            cell.detailTextLabel?.text = "Summary"
            return cell
        }
    }


    // MARK: - Navigation
    //Send image name to cameraViewController
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if let vc = segue.destination as? cameraViewController,
            let cell = sender as?UITableViewCell,
           let name = cell.textLabel?.text{
                vc.displayImageName = name
          
        }
    }
 

}
