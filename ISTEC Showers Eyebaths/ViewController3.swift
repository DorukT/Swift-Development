//
//  ViewController3.swift
//  ISTEC Showers Eyebaths
//  Safety Shower Builder
//
//  Created by Doruk Türkuçar on 20.09.2020.
//  Copyright © 2020 IST Safety Ltd. All rights reserved.
//

import UIKit
import WebKit

class ViewController3: UIViewController, WKNavigationDelegate, WKUIDelegate {

    @IBOutlet weak var webview2: WKWebView!
    @IBAction func refreshButton2(_ sender: Any) {
        webView.reload()
    }
    @IBOutlet weak var backBarButtonItem: UINavigationItem!
    
        var webView: WKWebView!
        
        //Rotate settings
        override func viewWillAppear(_ animated: Bool) {
         AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.landscapeRight, andRotateTo: UIInterfaceOrientation.landscapeRight)
             }
    
        //Webview
        override func loadView() {
           let webConfiguration = WKWebViewConfiguration()
           webView = WKWebView(frame: .zero, configuration: webConfiguration)
           webView.uiDelegate = self
           view = webView
        }
        
        override func viewDidLoad() {
           super.viewDidLoad()
           let myURL = URL(string:"https://www.ist.com.tr/onlinekatalog/index.php?id=3")
           let myRequest = URLRequest(url: myURL!)
           webView.load(myRequest)
            self.title = "Safety Shower & Eyebath Catalog"
            
            
            //back button
            let leftBarButtonItem = UIBarButtonItem(title: "3D Builder", style: .plain, target: self, action: #selector(Back))
                 navigationItem.leftBarButtonItem = leftBarButtonItem
           
            
            let refreshControl = UIRefreshControl()
                         refreshControl.addTarget(self, action: #selector(refreshButton2(_:)), for: UIControl.Event.valueChanged)
                         webView.scrollView.addSubview(refreshControl)
                         webView.scrollView.bounces = true
            
            //let value = UIInterfaceOrientation.landscapeRight.rawValue
            //UIDevice.current.setValue(value, forKey: "orientation")
            
            
        }
    
        //back button func
          @objc func Back() {
              self.navigationController!.popViewController(animated: true)
              
          }
 
    
    }
