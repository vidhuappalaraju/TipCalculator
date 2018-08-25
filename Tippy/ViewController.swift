//
//  ViewController.swift
//  Tippy
//
//  Created by Vidhu Appalaraju on 8/11/18.
//  Copyright © 2018 Vidhu Appalaraju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipPerPersonLabel: UILabel!
    @IBOutlet weak var guestField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        self.title = "Tip Calculator"
        self.view.backgroundColor = UIColor(red: 0.1765, green: 0.5922, blue: 0.2039, alpha: 1.0)
        tipControl.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.18, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        defaults.set(tipControl.selectedSegmentIndex, forKey: "tipDefault")
        let total = tip + bill
        
        
       
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let tipDef = defaults.integer(forKey: "tipDefault")
       tipControl.selectedSegmentIndex = tipDef
        
        calculateTip(1)
        calculateTipPerGuest(1)
    }
    

    @IBAction func calculateTipPerGuest(_ sender: Any) {
        let tipPercentages = [0.18, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0
        
        var billPerHead = Double(guestField.text!) ?? 0
        if billPerHead > 0 {
            billPerHead = (bill / billPerHead) * tipPercentages[tipControl.selectedSegmentIndex] + (bill/billPerHead)
            
            tipPerPersonLabel.text = String(format: "$%0.2f", billPerHead)
        }
        else{
            tipPerPersonLabel.text =
            String(format: "$%0.2f", 0)
        }
        
        
        
    }
    
    
}

