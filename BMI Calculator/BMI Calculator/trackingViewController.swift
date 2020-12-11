//
//  trackingViewController.swift
//  BMI Calculator
//
//  Created by Nisha Gohil on 2020-12-10.
//

import UIKit

//create array 
var array: [track] = []

//creates the tracks
class track{
    var name : String?
    var weight : String
    var BMI : String
    
    init(name: String, weight: String, BMI: String){
        self.name = name
        self.weight = weight
        self.BMI = BMI
    }
}
class trackingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   

    @IBOutlet weak var myTableView: UITableView!
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
         
        }

        //asinged number of cell as array count
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return array.count    }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            
            
            if cell == nil || cell?.detailTextLabel == nil || cell?.detailTextLabel == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
            }
            
            cell?.textLabel?.text = array[indexPath.row].name
            cell?.detailTextLabel?.text = array[indexPath.row].weight
            cell?.detailTextLabel?.text = array[indexPath.row].BMI
            
            
            return cell!
        }
    
    
    

        
        
        //to delete a track from swiping left
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                array.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            } else if editingStyle == .insert {
                
            }
            }
       

}
