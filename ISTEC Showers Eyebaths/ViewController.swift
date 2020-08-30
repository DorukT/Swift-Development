//
//  ViewController.swift
//  ISTEC Showers Eyebaths
//
//  Created by Doruk Türkuçar on 30.08.2020.
//  Copyright © 2020 IST Safety Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var configuratorImage: UIImageView!
    @IBOutlet weak var catalogImage: UIImageView!
    @IBOutlet weak var contactImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         let value = UIInterfaceOrientation.portrait.rawValue
                  UIDevice.current.setValue(value, forKey: "orientation")
                  
    }

    
    @IBAction func configuratorAction(_ sender: Any) {
        
        performSegue(withIdentifier: "page1", sender: nil)
    }
    
    @IBAction func catalogAction(_ sender: Any) {
        
        performSegue(withIdentifier: "page2", sender: nil)
    }

    @IBAction func contactAction(_ sender: Any) {
        
        performSegue(withIdentifier: "page3", sender: nil)
    }
    
    
    
}

