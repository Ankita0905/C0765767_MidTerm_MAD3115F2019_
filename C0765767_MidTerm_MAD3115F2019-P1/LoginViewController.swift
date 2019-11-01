//
//  ViewController.swift
//  C0765767_MidTerm_MAD3115F2019-P1
//
//  Created by Ankita Jain on 2019-10-31.
//  Copyright © 2019 Ankita Jain. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
       @IBOutlet weak var txtPassword: UITextField!
       @IBOutlet weak var lblVersion: UILabel!
       @IBOutlet weak var btnLogin: UIButton!
    
   
    override func viewDidLoad() {
           super.viewDidLoad()
          showVersion()
       }
   
    
    @IBAction func btnLogin(_ sender: UIButton) {
        
        
        
       
        if readInformationPlist()
                {
                    let sb=UIStoryboard(name: "Main", bundle: nil)
                           let customerListVC=sb.instantiateViewController(identifier: "customerListVC") as! CustomerListViewController
                           navigationController?.pushViewController(customerListVC, animated: true)

//                let uname=txtUser.text!
//                print("Hello \(uname)")
            }
                else{
                    let alert = UIAlertController(title: "Wrong Username Or Password", message: "change username or password", preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {action
                        in
                        print("Cancle clicked")
                    }))
                    self.present(alert, animated: true)
                    print("invalid username or password")
                }
        
    }
   
    
    
    func readInformationPlist() -> Bool{
       if let bundlePath = Bundle.main.path(forResource: "Users", ofType: "plist") {
           let dictionary = NSMutableDictionary(contentsOfFile: bundlePath)
            let usersList = dictionary!["Users"] as! NSArray
        
            for u in usersList
            {
                 let user = u as! NSDictionary
                let uname = user["username"]! as! String
                let pwd = user["password"]! as! String
                if uname==txtUser.text! && pwd==txtPassword.text!
                {
                    return true
                }
            }
        
       
           }
            return false
       }
       
    
    func showVersion()
 {
    if let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString"), let versionCode = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion")  {
        
        lblVersion.text = "Version \(version) (\(versionCode))"
    }
    

    }

}

