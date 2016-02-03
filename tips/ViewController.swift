//
//  ViewController.swift
//  tips
//
//  Created by William Xu on 12/31/15.
//  Copyright © 2015 William Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tipPercentages = [0.18, 0.2, 0.22]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tip Calculator"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.doubleForKey("default_tip_percentage")
        tipPercentages[1] = tipValue * 0.01
        tipControl.setTitle("\(tipValue)%", forSegmentAtIndex: 1)
    }
    
    

    @IBAction func onEditingChanged(sender: AnyObject) {

        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount  = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

