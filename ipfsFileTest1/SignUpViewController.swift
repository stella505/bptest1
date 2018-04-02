//
//  SignUpViewController.swift
//  ipfsFileTest1
//
//  Created by Miaoshi Wu on 4/2/18.
//  Copyright © 2018 Miaoshi Wu. All rights reserved.
//

import Cocoa

class SignUpViewController: NSViewController  {
    
    @IBOutlet weak var _usernametable: NSTextField!
    @IBOutlet weak var _passwordtable: NSTextField!
    @IBOutlet weak var _emailtable: NSTextField!
    @IBOutlet weak var _regiontable: NSTextField!
    
    @IBAction func SignUPButton(_ sender: Any) {
        let UserName = _usernametable.stringValue
        let Password = _passwordtable.stringValue
        let Email = _emailtable.stringValue
        let Region = _regiontable.stringValue
        if (UserName == "" || Password == "" || Email == "" || Region == "")
        {
            return
        }
        Register(UserName,Password,Email,Region)
    }
    func Register(_ user:String,_ password:String,_ email:String,_ region:String)
    {
        
    }
}
