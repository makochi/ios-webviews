//
//  ViewController.swift
//  ThirdPartyCookieTest
//
//  Created by 海野 誠 on 2018/05/25.
//  Copyright © 2018年 海野 誠. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {

    @IBOutlet weak var btnWebView: UIButton!
    @IBOutlet weak var btnWKWebView: UIButton!
    @IBOutlet weak var btnSafariView: UIButton!
    @IBOutlet weak var swcAcceptCookie: UISwitch!
    var authSession: SFAuthenticationSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showCookiePolicyAlert()
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func acceptCookieChanged(_ sender: Any) {
        if swcAcceptCookie.isOn {
            HTTPCookieStorage.shared.cookieAcceptPolicy = .always
        } else {
            HTTPCookieStorage.shared.cookieAcceptPolicy = .onlyFromMainDocumentDomain
        }
    }
    
    @IBAction func btnWebViewTouched(_ sender: Any) {
        let storyboard = UIStoryboard(name: "WebViewController", bundle: nil)
        let next = storyboard.instantiateViewController(withIdentifier: "WebViewController")
        self.navigationController?.present(next, animated: true, completion: nil)
    }
    
    @IBAction func btnWKWebViewTouched(_ sender: Any) {
        let storyboard = UIStoryboard(name: "WKWebViewController", bundle: nil)
        let next = storyboard.instantiateViewController(withIdentifier: "WKWebViewController")
        self.navigationController?.present(next, animated: true, completion: nil)
    }
    
    @IBAction func btnSafariViewTouched(_ sender: Any) {
        let safariVC = SFSafariViewController(url: URL(string: "https://dpoint.jp/ctrw/web/index.html")!)
        safariVC.delegate = self
        self.navigationController?.present(safariVC, animated: true, completion: nil)
    }
    
    @IBAction func btnViewCookiesTouched(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CookieViewController", bundle: nil)
        let next = storyboard.instantiateViewController(withIdentifier: "CookieViewController")
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func btnRemoveCookiesTouched(_ sender: Any) {
        HTTPCookieStorage.shared.removeCookies(since: Date.init(timeIntervalSince1970: 0))
    }
    
    @IBAction func btnLoginTouched(_ sender: Any) {
        let url = URL(string: "https://my.gnavi.co.jp/s/login/")
        let callbackScheme = "https"
        authSession = SFAuthenticationSession(url: url!, callbackURLScheme: callbackScheme, completionHandler: { callbackURL, error in
            if let callBackURL = callbackURL {
                print("callbackURL: \(callbackURL)")
            }
        })
        authSession?.start()
    }
    
}

