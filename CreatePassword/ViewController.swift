//
//  ViewController.swift
//  CreatePassword
//
//  Created by 糊涂 on 2017/11/9.
//  Copyright © 2017年 糊涂. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    private var strNumber = "0123456789"
    private var strLLetter = "abcdefghijklmnopqrstuvwxyz"
    private var strULetter = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    private var strSymbol = "~!@#$%^&*_[]{};':\",.<>?+=-?"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBOutlet weak var txtLenght: NSTextField!
    
    @IBOutlet weak var txtCount: NSTextField!
    @IBOutlet weak var number: NSButton!
    @IBOutlet weak var lLetter: NSButton!
    @IBOutlet weak var uLetter: NSButton!
    @IBOutlet weak var symbol: NSButton!
    @IBOutlet var txt: NSTextView!
    
    @IBAction func createPassword(_ sender: Any) {
        let lenght = txtLenght.intValue
        let count = txtCount.intValue
        let data = getSourceStr();
        
        for _ in 0...count-1 {
            var a : NSString = ""
            for _ in 0...lenght-1 {
                let sl = NSString.init(string: data).length
                let n = Int(arc4random_uniform(UInt32(sl)))
                var char = data.character(at: n);
                
                a = a.appendingFormat("%@", NSString.init(characters: &char, length: 1))
            }
            txt.string.append(a.appendingFormat("\n") as String)
        }
    }
    
    func getSourceStr() -> NSString {
        var str = ""
        if number.state == NSControl.StateValue.on {
            str = str + strNumber
        }
        if lLetter.state == NSControl.StateValue.on {
            str = str + strLLetter
        }
        if uLetter.state == NSControl.StateValue.on {
            str = str + strULetter
        }
        if symbol.state == NSControl.StateValue.on {
            str = str + strSymbol
        }
        return NSString.init(string: str);
    }
}

