//
//  secondViewController.swift
//  XcodeDatabase
//
//  Created by mac on 2019-11-22.
//  Copyright © 2019 Centennial College. All rights reserved.
//

import UIKit
import Firebase

class secondViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    
    
    @IBAction func create(_ sender: UIButton) {
        
        var e  = email.text!
        var p  = password.text!
        
        Auth.auth().createUser(withEmail: e, password: p) { authResult, error in
            if ((error) != nil){
                var alertController = UIAlertController(title: "Error", message:
                    error?.localizedDescription as! String, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }
            else{
                self.presentingViewController?.dismiss(animated: false, completion:nil)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
