//
//  DetailsViewController.swift
//  MileStone Project 1
//
//  Created by Avinash Muralidharan on 30/08/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var selectedCountry : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedCountry!
        navigationController?.navigationBar.prefersLargeTitles = false
        imageView.image = UIImage(named:selectedCountry!)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(shareFlag))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
        imageView?.contentMode = .scaleAspectFit
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
        imageView?.contentMode = .scaleAspectFit
    }

    @objc func shareFlag(){
        
        guard let image = imageView?.image?.jpegData(compressionQuality: 1) else {
            print("Image not found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        present(vc,animated: true)
    }
    
}
