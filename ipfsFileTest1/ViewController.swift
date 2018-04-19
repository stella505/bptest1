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
        
        db = SQLiteDB.shared
//        let preferences = UserDefaults.standard
//        Do any additional setup after loading the view.
        db.open(dbPath: "/Users/miaoshiwu/Desktop/ipfsFileTest1/data.db", copyFile:true)
        //initUser()
    }
    func initUser(){
        let data = db.query(sql: "select * from usertable")
        if data.count > 0 {
            let user = data[data.count - 1]
            _userName.stringValue = user["userName"] as! String
            _password.stringValue = user["password"] as! String
        }
    }
    @IBAction func LoginButton(_ sender: Any) {
        //self.performSegue(withIdentifier: gotoFirstPage, sender: Any)
        let UserName = _userName.stringValue
        let Password = _password.stringValue
        if (UserName == "" || Password == "")
        {
            return
            //exit(0)
        }else{
            DoLogin(UserName,Password)
        }
    }
    func DoLogin(_ UserName: String,_ Password: String){
        //        if(_login_button.title?.text == "Logout")
        //        {
        //            let preferences = UserDefaults.standard
        //          preferences.removeObject(forKey:"session")
        //            LoginToDo()
        //        }
        
        let data = db.query(sql: "select * from usertable")
        print(data)
        for i in 0..<data.count
        {
            let username = data[i]["userName"] as! String
            let password = data[i]["password"] as! String
            if(username == UserName && password == Password)
            {
                shell("ipfs daemon")
            }else{
                print("no match info")
                exit(0)
            }
        }
    }
    
    @discardableResult
    func shell(_ args: String...) -> Int32 {
        
        let task = Process()
        let pipe = Pipe()
        task.launchPath = "/Users/miaoshiwu/.ipfs/"
        task.arguments = args
        task.standardOutput = pipe
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        
        print(output!)
        task.waitUntilExit()
        return task.terminationStatus
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

