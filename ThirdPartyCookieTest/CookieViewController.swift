//
//  CookieViewController.swift
//  ThirdPartyCookieTest
//
//  Created by 海野誠 on 2018/05/26.
//  Copyright © 2018年 海野 誠. All rights reserved.
//

import UIKit

class CookieViewController: UIViewController {

    @IBOutlet weak var txvCookies: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let cookies = HTTPCookieStorage.shared.cookies
        guard let uwCookies = cookies else {
            return
        }
        var strCookies = ""
        for cookie in uwCookies {
            strCookies += "name=" + cookie.name + " domain=" + cookie.domain + "\n"
        }
        txvCookies.text = strCookies
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
