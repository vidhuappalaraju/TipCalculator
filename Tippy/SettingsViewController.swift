//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Vidhu Appalaraju on 8/13/18.
//  Copyright © 2018 Vidhu Appalaraju. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let def = UserDefaults.standard

    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.1765, green: 0.5922, blue: 0.2039, alpha: 1.0)
        tipControl.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onChange(_ sender: Any) {
        
        def.set(tipControl.selectedSegmentIndex, forKey:"tipDefault")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipControl.selectedSegmentIndex = def.integer(forKey: "tipDefault")
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
