//
//  WebViewController.swift
//  ThirdPartyCookieTest
//
//  Created by 海野 誠 on 2018/05/25.
//  Copyright © 2018年 海野 誠. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = URL(string: "https://dpoint.jp/ctrw/web/index.html")
        let req = URLRequest(url: url!)
        webView.loadRequest(req)
    }
    
    func showCookiePolicyAlert() {
        let msg: String?
        switch HTTPCookieStorage.shared.cookieAcceptPolicy {
        case .onlyFromMainDocumentDomain:
            msg = "onlyFromMainDocumentDomain"
        case .always:
            msg = "always"
        default:
            msg = "never"
        }
        let alert = UIAlertController(title: "Cookie設定", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    @IBAction func btnCcloseTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
