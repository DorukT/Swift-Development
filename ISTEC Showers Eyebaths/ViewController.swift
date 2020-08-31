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
    
    //Force landscape portrait
    
    override func viewWillAppear(_ animated: Bool) {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
        }
    
    //Webview settings
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ISTEC Showers & Eyebaths"
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped1(tapGestureRecognizer:)))
               configuratorImage.isUserInteractionEnabled = true
               configuratorImage.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped2(tapGestureRecognizer:)))
        catalogImage.isUserInteractionEnabled = true
        catalogImage.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped3(tapGestureRecognizer:)))
        contactImage.isUserInteractionEnabled = true
        contactImage.addGestureRecognizer(tap3)
        
    }
    
    @objc func imageTapped1(tapGestureRecognizer: UITapGestureRecognizer)
    {
        _ = tapGestureRecognizer.view as! UIImageView
       performSegue(withIdentifier: "page1", sender: nil)
    }
    
    @objc func imageTapped2(tapGestureRecognizer: UITapGestureRecognizer)
    {
        _ = tapGestureRecognizer.view as! UIImageView
       performSegue(withIdentifier: "page2", sender: nil)
    }
    
    @objc func imageTapped3(tapGestureRecognizer: UITapGestureRecognizer)
       {
           _ = tapGestureRecognizer.view as! UIImageView
          performSegue(withIdentifier: "page3", sender: nil)
       }
    
   
    
}

