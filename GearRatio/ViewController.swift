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
    @IBOutlet weak var skidPatchesLabel: UILabel!
    
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
    
    
    func simplifyNumbers(c1: Double, c2: Double) -> (Double, Double) {
        
        var tmp1 = c1 , tmp2 = c2
        
        for i in 1...10 {
            var pn: Double
            pn = Double(10-i)
            
            if (remainder(tmp1, pn) == 0) && (remainder(tmp2, pn) == 0) {
                tmp1 = tmp1/pn
                tmp2 = tmp2/pn
            }
            
        }
        return (tmp1, tmp2)
    }
    

    // handling the "actions" after pressing the button
    @IBAction func calculateButton(sender: AnyObject) {
        var ratio: Double = 0.0
        var cr: Double = 0.0
        var cg: Double = 0.0
        var tmp_str: String, tmp_str2: String
        
        //content in the TextFiekds are strings and have to be converted first b4 calculation
        //converting to from Strings to double
        cr = stringToDouble(chainNumberTextField.text)
        cg = stringToDouble(cogNumberTextField.text)
        
        
        
        ratio = cr/cg
        
        // Double to String
        tmp_str = NSString(format: "%.2f", ratio) as String
        tmp_str2 = NSString(format: "%.2f", simplifyNumbers(cr, c2: cg).1) as String
        
        chainNumberTextField.resignFirstResponder()
        cogNumberTextField.resignFirstResponder()
        
        gearRatioLabel.text = "Gear Ratio: " + tmp_str
        skidPatchesLabel.text = "No. of Skid Patches: " + tmp_str2
        
        skidPatchesLabel.hidden = false
        gearRatioLabel.hidden = false
        
    }


}

