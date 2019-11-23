//
//  ViewController.swift
//  XcodeDatabase
//
//  Created by mac on 2019-11-21.
//  Copyright © 2019 Centennial College. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(Auth.auth().currentUser?.uid != nil){
          //  let loginVC = UIStoryboard(name: "Data", bundle: nil).instantiateViewController(withIdentifier: "dataViewController") as! dataViewController
            //self.present(loginVC, animated: true, completion: nil)
            
            
        }
       
        
    }
    
    @IBAction func login(_ sender: UIButton) {
        var e = email.text!
        var p = password.text!
        
        Auth.auth().signIn(withEmail: e, password: p) { [weak self] authResult, error in
            if(error != nil){
                var alertController = UIAlertController(title: "Error", message:
                    error?.localizedDescription as! String, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                
                self?.present(alertController, animated: true, completion: nil)
            }
            else{
                var uid = Auth.auth().currentUser!.uid
                print(uid)
                let loginVC = UIStoryboard(name: "Data", bundle: nil).instantiateViewController(withIdentifier: "dataViewController") as! dataViewController
                self!.present(loginVC, animated: true, completion: nil)
                
            }
        }
        
    }


}

