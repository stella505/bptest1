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
        
        let preferences = UserDefaults.standard
        if(preferences.object(forKey: "session")!=nil)
        {
            LoginDone()
        }else{
            LoginToDo()
        }
        // Do any additional setup after loading the view.
    }

    
    @IBAction func LoginButton(_ sender: Any) {
        if(_login_button.titleLabel?.text == "Logout")
        {
            let preferences = UserDefaults.standard
            preferences.removeObject(forKey: "session")
            LoginToDo()
        }
        let UserName = _userName
        let Password = _password
        if (UserName == "" || Password == "")
        {
            return
        }
        DoLogin(UserName!,Password!)
    }
    func DoLogin(_ user:String,_ psw:String)
    {
        let url = URL(String:"http")
        let session = UPLSession.shared
        
        let request = NSMutableURLRequest(url:url!)
        request.httpMethod = "POST"
        let paramToSend = "username" + user + "&password=" + psw
        request.httpBody = paramToSend.data(using: String.Encoding.utf8)
        let task = session.dataTask(with:request as URLRequest, completionHandler:
        {
            (data,response,error) in
            guard let _:Data = data else
            {
                return
            }
            
        })
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

