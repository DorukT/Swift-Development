//
//  ViewController2.swift
//  ISTEC Showers Eyebaths
//  Safety Shower Builder
//
//  Created by Doruk Türkuçar on 20.09.2020.
//  Copyright © 2020 IST Safety Ltd. All rights reserved.
//

import UIKit
import WebKit

class ViewController2: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    @IBOutlet weak var webview1: WKWebView!
    @IBAction func refreshButton1(_ sender: UIButton) {
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
       let myURL = URL(string:"https://www.ist.com.tr/3d/en/")
       let myRequest = URLRequest(url: myURL!)
       webView.load(myRequest)
       self.title = "3D Builder"
        
        //back button
        let backBarButtonItem = UIBarButtonItem(title: "Homepage", style: .plain, target: webview1, action: #selector(webview1.reload))
        navigationItem.backBarButtonItem = backBarButtonItem
        
        //refresh button
       let refreshControl = UIRefreshControl()
       refreshControl.addTarget(self, action: #selector(refreshButton1(_:)), for: UIControl.Event.valueChanged)
       webView.scrollView.addSubview(refreshControl)
       webView.scrollView.bounces = true
    }

        
 }

