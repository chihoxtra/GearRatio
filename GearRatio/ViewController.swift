//
//  ViewController.swift
//  GearRatio
//
//  Created by pun samuel on 18/7/15.
//  Copyright (c) 2015 Samuel Pun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chainNumberTextField: UITextField!
    @IBOutlet weak var cogNumberTextField: UITextField!
    @IBOutlet weak var gearRatioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func stringToDouble(thestr: String) -> Double {
        var doubleNSString = NSString(string: thestr)
        var toDouble = doubleNSString.doubleValue
        return toDouble
    }
    

    @IBAction func calculateButton(sender: AnyObject) {
        var ratio: Double = 0.0, cr: Double, cg: Double, tstr:String
        
        cr = stringToDouble(chainNumberTextField.text)
        cg = stringToDouble(cogNumberTextField.text)
        
        ratio = cr/cg
        
        tstr = NSString(format: "%.2f", ratio) as String
        
        chainNumberTextField.resignFirstResponder()
        cogNumberTextField.resignFirstResponder()
        
        gearRatioLabel.text = tstr
        gearRatioLabel.hidden = false
        
    }


}

