//
//  AppDelegate.swift
//  ipfsFileTest1
//
//  Created by Miaoshi Wu on 3/28/18.
//  Copyright © 2018 Miaoshi Wu. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let db = SQLiteDB.shared
    
var masterViewController: ViewController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        masterViewController = ViewController(nibName:NSNib.Name(rawValue: "ViewController"), bundle:nil)
//        if db.open() {
//            // Query category
//            let cats = Category.rows(order:"id ASC")
//            NSLog("Got categories: \(cats)")
//        }
//    NSWindow.init(contentViewController: NSViewController).addSubview(masterViewController.view)
//
//        masterViewController.view.frame = ( NSWindow.init(contentViewController:ViewController) as NSView).bounds
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

