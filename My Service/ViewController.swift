//
//  ViewController.swift
//  My Service
//
//  Created by Student08 on 6/15/2560 BE.
//  Copyright © 2560 SNRU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Explicit
    var myString = ""
    var strUser: String? = nil
    var strPassword: String? = nil
    var strMyJSON = ""
    
    
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var alertLabel: UILabel!
    
    
    @IBAction func loginButton(_ sender: Any) {
        //Get Value From TextField
        strUser = userTextField.text
        strPassword = passwordTextField.text
        
        //Check Space
        if strUser?.characters.count == 0 || strPassword?.characters.count == 0 {
            alertLabel.alpha = 1
        
        } else {
            
          alertLabel.alpha = 0
            let strUrl = "http://androidthai.in.th/snru/getUserWhereprae.php?isAdd=true&User="+strUser!+""
            print("strUrl ==> \(strUrl)")
            readJSON(strURL: strUrl)
            
            
            
        } // if
        
        
    } //loginButton
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        
    } //Main Method
    
    func readJSON(strURL:String) -> Void {
        
        // Process Connected Http
        let urlPHP = strURL
        
        //Chang String to url String
        let myURL = URL(string: urlPHP)
        
        let request = NSMutableURLRequest(url: myURL!)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("Error ==> \(String(describing: error))")
            }   else {
                
                if let unwrappedData = data {
                    
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    let strJSON = dataString as Any
                    print("strJSON ==> \(strJSON)")
                    
                    if dataString != nil {
                        print("dataString not nil")
                        
                        } else {
                         print("dataString nil")
                              }
                    
                    
                    }
                    
                    
                    }
            
                    
                    let strKey = ","
                    if let myContentArray = dataString?.components(separatedBy: strKey) {
                        
                   
                    print("myContentArray[3] ==> \(myContentArray[3])")
                        
                        
                        
                      // Check Password
                        let myPassword = "\"Password\":\"" + self.strPassword! + "\"
                        if strPassword == myContentArray[3] {
                        // Password True
                        print("Password True")
                        performSegue(withIdentifier: "GoToMap", sender: <#T##Any?#>)
                            
                        } else {
                        //Password False
                            print("Password False")
                        
                        
                        }
                        
                        
                    
                    } // if
                    
                    
                    
                    
                    
                }
                
                
            } // if1
            
            
        }
        task.resume()
        
        
        
    } // readJSON
    


    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


} // Main Class

