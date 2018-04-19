//
//  TransferPage.swift
//  ipfsFileTest1
//
//  Created by Miaoshi Wu on 4/16/18.
//  Copyright © 2018 Miaoshi Wu. All rights reserved.
//

import Cocoa

class TransferPage: NSObject {

    @IBAction func AddButton(_ sender: Any) {
        let filePath = _UploadFilePath.doubleAction?.description
        shell("ipfs add" + filePath!)
    }
    @IBAction func GetButton(_ sender: Any) {
        let hashCode = _DownloadHashCode.stringValue
        shell("ipfs catch" + hashCode)
    }
    @discardableResult
    func shell(_ args: String...) -> Int32 {
        
        let task = Process()
        let pipe = Pipe()
        task.launchPath = "/Users/miaoshiwu"
        task.arguments = args
        task.standardOutput = pipe
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        
        print(output!)
        task.waitUntilExit()
        return task.terminationStatus
    }
    @IBOutlet weak var _DownloadHashCode: NSTextField!
    @IBOutlet weak var _UploadFilePath: NSPathControl!
    @IBOutlet weak var _BackHome: NSButton!
}

