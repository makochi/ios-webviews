//
//  ViewController.swift
//  ThirdPartyCookieTest
//
//  Created by 海野 誠 on 2018/05/25.
//  Copyright © 2018年 海野 誠. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnWebView: UIButton!
    @IBOutlet weak var btnWKWebView: UIButton!
    @IBOutlet weak var btnSafariView: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnWebViewTouched(_ sender: Any) {
        let storyboard = UIStoryboard(name: "WebViewController", bundle: nil)
        let next = storyboard.instantiateViewController(withIdentifier: "WebViewController")
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func btnWKWebViewTouched(_ sender: Any) {
        let storyboard = UIStoryboard(name: "WKWebViewController", bundle: nil)
        let next = storyboard.instantiateViewController(withIdentifier: "WKWebViewController")
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func btnSafariViewTouched(_ sender: Any) {
    }
}

