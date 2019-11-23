//
//  dataViewController.swift
//  XcodeDatabase
//
//  Created by mac on 2019-11-22.
//  Copyright © 2019 Centennial College. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseDatabase

class dataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
        
        //writing Data
        
         ref.childByAutoId().setValue(["name":"Tom","role":"Admin","age":"20"])
        
        //reading
        ref.child("id").observeSingleEvent(of: .value)
         { (snapshoot) in
          let employeedata = snapshoot.value as?[String:Any]
         }
        
        //updating
        
         let childUpdates = ["id/name": "john", "-LuFA9ta3yxAHViMqZzL/name": "Maya"]
         ref.updateChildValues(childUpdates)
        
        //delete
        
         ref.child("id").removeValue()
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
