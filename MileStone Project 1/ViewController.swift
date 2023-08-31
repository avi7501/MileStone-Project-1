//
//  ViewController.swift
//  MileStone Project 1
//
//  Created by Avinash Muralidharan on 30/08/23.
//

import UIKit

class ViewController: UITableViewController {
    
    @IBOutlet var Image: UIImageView!
    
    var countries = ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Milestone 1 Project"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        cell.imageView?.image = UIImage(named: countries[indexPath.row])
     
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailsViewController{
            vc.selectedCountry = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
  

}
