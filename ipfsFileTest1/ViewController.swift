//
//  ViewController.swift
//  ipfsFileTest1
//
//  Created by Miaoshi Wu on 3/28/18.
//  Copyright © 2018 Miaoshi Wu. All rights reserved.
//



 



import Cocoa

class ViewController: NSViewController {

    var db:SQLiteDB!
    
//    @IBOutlet weak var _userNameLabel: NSTextField!
//    @IBOutlet weak var _passwordLabel: NSTextField!
    
    @IBOutlet weak var _userName: NSTextField!
    @IBOutlet weak var _password: NSSecureTextField!
//    @IBOutlet weak var _signUp_button: NSButton!
//    @IBOutlet weak var _login_button: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let preferences = UserDefaults.standard
//        Do any additional setup after loading the view.
//        db.open(dbPath: "~/Desktop/ipfsFileTest1/data.db", copyFile: true)
//        
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        DoLogin()
    }
    func DoLogin(){
        //        if(_login_button.title?.text == "Logout")
        //        {
        //            let preferences = UserDefaults.standard
        //            preferences.removeObject(forKey:"session")
        //            LoginToDo()
        //        }
        let UserName = _userName.stringValue
        let Password = _password.stringValue
        if (UserName == "" || Password == "")
        {
            return
        }
        let data = db.query(sql: "select * from usertable")
        print(data)
        for i in 0..<data.count
        {
            let username = data[i]["userName"] as! String
            let password = data[i]["password"] as! String
            if(username != UserName || password != Password
                )
            {
                break
            }
        }
        
        self.view.window?.close()
    }
//    func DoLogin(_ user:String,_ psw:String)
//    {
//        let url = NSURL(string:"http://www.kaleidosblog.com/tutorial/login/api/login")
//        let session = URLSession.shared
//
//        let request = NSMutableURLRequest(url:url! as URL)
//        request.httpMethod = "POST"
//        let paramToSend = "username" + user + "&password=" + psw
//        request.httpBody = paramToSend.data(using: String.Encoding.utf8)
//        let task = session.dataTask(with:request as URLRequest, completionHandler:
//        {
//            (data,response,error) in
//            guard let _:Data = data else
//            {
//                return
//            }
//
//        })
//    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

