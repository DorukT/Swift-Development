//
//  ViewController5.swift
//  ISTEC Showers Eyebaths
//  Safety Shower Builder
//
//  Created by Doruk Türkuçar on 20.09.2020.
//  Copyright © 2020 IST Safety Ltd. All rights reserved.
//

import UIKit
import WebKit

class ViewController5: UIViewController, WKNavigationDelegate, WKUIDelegate {

    @IBOutlet weak var webview5: WKWebView!
    
   var webView: WKWebView!
        
    //Webview
        override func loadView() {
           let webConfiguration = WKWebViewConfiguration()
           webView = WKWebView(frame: .zero, configuration: webConfiguration)
           webView.uiDelegate = self
           view = webView
        }
        
        override func viewDidLoad() {
           super.viewDidLoad()
           let myURL = URL(string:"https://www.ist.com.tr/algoritma?Id=64")
           let myRequest = URLRequest(url: myURL!)
           webView.load(myRequest)
        }

}
