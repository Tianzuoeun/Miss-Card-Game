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
    
    lazy var dataPass = {DataPass.shareInstance()}()
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        // #warning Incomplete implementation, return the number of rows
        switch section {
            
        case 0:
            
            return imageModel.cameraImageNames.count
            
            
        case 1:
            return 1
            
        case 2:
            return dataPass.imageName.count
            
        default:
            return 0
        
        }
        
    }
   

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageNameCell", for: indexPath)
            
            // Configure the cell...
            if let name = self.imageModel.cameraImageNames[indexPath.row] as? String{
                
                cell.textLabel!.text = name
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCell", for: indexPath)
            cell.textLabel?.text = "All Image"
            cell.detailTextLabel?.text = "Summary"
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PokerImageCell", for: indexPath)
            if let name = self.dataPass.imageName[indexPath.row] as? String{
                
                cell.textLabel!.text = name
                if let description = self.dataPass.explaination[indexPath.row] as? String{
                    cell.detailTextLabel?.text = description} }
                return cell
           
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageNameCell", for: indexPath)
            
            // Configure the cell...
            if let name = self.imageModel.cameraImageNames[indexPath.row] as? String{
                
                cell.textLabel!.text = name
            }
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
        else if let vc = segue.destination as? PokerViewController,
            let cell = sender as?UITableViewCell,
           let name = cell.textLabel?.text{
                vc.displayImageName = name
          
        }
    }
    

}
