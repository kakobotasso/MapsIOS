//
//  WebViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 11/03/17.
//  Copyright © 2017 EricBrito. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    var url: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webPageURL = URL(string: url)
        let request = URLRequest(url: webPageURL!)
        
        webView.loadRequest(request)
        webView.scrollView.bounces = false
        
    }
    
    @IBAction func runJS(_ sender: UIBarButtonItem) {
        let js = "alert('teste')"
        webView.stringByEvaluatingJavaScript(from: js)
    }
    
}

// MARK: UIWebViewDelegate
extension WebViewController: UIWebViewDelegate {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(request.url!.absoluteString)
        
        if request.url!.absoluteString.range(of: "ads") != nil {
            return false
        }
        
        return true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loader.stopAnimating()
    }
}
