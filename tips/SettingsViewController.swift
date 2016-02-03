//
//  SettingsViewController.swift
//  tips
//
//  Created by William Xu on 1/16/16.
//  Copyright © 2016 William Xu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipLabel: UILabel!
    
    @IBOutlet weak var defaultTipField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func OnDefaultEditingChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(Double(defaultTipField.text!)!, forKey: "default_tip_percentage")
        defaults.synchronize()
    }
    
    @IBAction func OnTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
