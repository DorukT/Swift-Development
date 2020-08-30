//
//  ViewController2.swift
//  ISTEC Showers Eyebaths
//
//  Created by Doruk Türkuçar on 30.08.2020.
//  Copyright © 2020 IST Safety Ltd. All rights reserved.
//

import UIKit
import WebKit

class ViewController2: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    @IBOutlet weak var webview1: WKWebView!
    
    var webView: WKWebView!
    
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
        self.title = "3D Configurator"
        
        let backBarButtonItem = UIBarButtonItem(title: "Main Page", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
        
    }
    
    
}
