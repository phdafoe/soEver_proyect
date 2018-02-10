//
//  WebViewGenericoViewController.swift
//  soEver
//
//  Created by Andres Felipe Ocampo Eljaiesk on 31/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit
import WebKit

class WebViewGenericoViewController: UIViewController {
    
    //MARK: - Properties
    var myUrl : String?
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    

    //MARK: - IBActions
    @IBAction func closeVCACTION(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let myUrlString = myUrl else { return }
        let urlData = URL(string: myUrlString)!
        let urlResquest = URLRequest(url: urlData)
        myWebView.load(urlResquest)
        
        myWebView.navigationDelegate = self
    
        myActivityIndicator.isHidden = true
        
        self.title = myUrlString

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}

extension WebViewGenericoViewController : WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        myActivityIndicator.isHidden = false
        myActivityIndicator.startAnimating()
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.isHidden = true
        myActivityIndicator.stopAnimating()
    }
    
}
