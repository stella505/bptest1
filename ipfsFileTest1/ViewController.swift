//
//  ViewController.swift
//  ipfsFileTest1
//
//  Created by Miaoshi Wu on 3/28/18.
//  Copyright © 2018 Miaoshi Wu. All rights reserved.
//



 



import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var _userName: NSTextField!
    @IBOutlet weak var _password: NSSecureTextField!
    @IBOutlet weak var _signUp_button: NSButton!
    @IBOutlet weak var _login_button: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func LoginButton(_ sender: Any) {
        let UserName = _userName
        let Password = _password
        if (UserName == "" || Password == "")
        {
            return
        }
        
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

