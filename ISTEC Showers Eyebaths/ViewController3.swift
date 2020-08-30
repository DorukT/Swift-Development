//
//  ViewController3.swift
//  ISTEC Showers Eyebaths
//
//  Created by Doruk Türkuçar on 30.08.2020.
//  Copyright © 2020 IST Safety Ltd. All rights reserved.
//

import UIKit
import WebKit

class ViewController3: UIViewController, WKNavigationDelegate, WKUIDelegate {

    @IBOutlet weak var webview2: WKWebView!
    
        var webView: WKWebView!
        
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
            self.title = "Catalog"
            let backBarButtonItem = UIBarButtonItem(title: "Showers & Eyebaths", style: .plain, target: nil, action: nil)
                 navigationItem.backBarButtonItem = backBarButtonItem
           
            //let value = UIInterfaceOrientation.landscapeRight.rawValue
            //UIDevice.current.setValue(value, forKey: "orientation")
            
            
        }
        
    }
