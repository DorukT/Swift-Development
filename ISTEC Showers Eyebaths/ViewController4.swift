//
//  ViewController4.swift
//  ISTEC Showers Eyebaths
//  Safety Shower Builder
//
//  Created by Doruk Türkuçar on 20.09.2020.
//  Copyright © 2020 IST Safety Ltd. All rights reserved.
//

import UIKit
import WebKit

class ViewController4: UIViewController, WKNavigationDelegate, WKUIDelegate {

    @IBOutlet weak var webview3: WKWebView!
    @IBAction func refreshButton3(_ sender: Any) {
        webView.reload()
    }
    @IBOutlet weak var backBarButtonItem: UINavigationItem!
    
    var webView: WKWebView!
        
    //Rotate settings
    override func viewWillAppear(_ animated: Bool) {
         AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
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
           let myURL = URL(string:"https://www.ist.com.tr/s-46-contact.html")
           let myRequest = URLRequest(url: myURL!)
           webView.load(myRequest)
            self.title = "Contact Us"
            
            let backBarButtonItem = UIBarButtonItem(title: "3D Builder", style: .plain, target: webview3, action: #selector(webview3.reload))
                 navigationItem.backBarButtonItem = backBarButtonItem
            
            let refreshControl = UIRefreshControl()
              refreshControl.addTarget(self, action: #selector(refreshButton3(_:)), for: UIControl.Event.valueChanged)
              webView.scrollView.addSubview(refreshControl)
              webView.scrollView.bounces = true
            
        }
        
    }
