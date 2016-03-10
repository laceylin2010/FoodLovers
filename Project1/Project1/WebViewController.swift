//
//  WebViewController.swift
//  Project1
//
//  Created by Lacey Vu on 2/29/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, Identity
{
    var matches: Matches?
    
    class func id() -> String
    {
        return "WebViewController"
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadWebView()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()

    }
    
    func loadWebView()
    {
        let frame = CGRect(x: 0.0, y: 75.0, width: self.view.frame.width, height: self.view.frame.height)
        let webView = WKWebView(frame: frame)
        if let recipeId = matches?.id{
            let url = NSURL(string: "http://www.yummly.com/recipe/\(recipeId)")
            let request = NSMutableURLRequest(URL: url!)
            
            self.view.addSubview(webView)
            webView.loadRequest(request)
        }
    }
    

}
