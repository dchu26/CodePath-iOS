//
//  ViewController.swift
//  Prework
//
//  Created by David Chu on 8/16/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        self.billAmountTextField.becomeFirstResponder()
        
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        
        let tipPercentagesInitial = [0.15,0.18,0.2]
        let defaults = UserDefaults.standard
        defaults.set(tipPercentagesInitial, forKey: "key")
        defaults.synchronize()
        
        //let tipPercentages = defaults.object(forKey: "key") as? [Double]
        let tipPercentages = [0.15,0.18,0.2]
        let tip = bill * ((tipPercentages[tipControl.selectedSegmentIndex]))
        let total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        /*let bill = Double(billAmountTextField.text!) ?? 0
        let tip1 = Double(defaultTip1.text!) ?? 0
        let tip2 = Double(defaultTip2.text!) ?? 18
        let tip3 = Double(defaultTip3.text!) ?? 20
        let tipPercentagesChanged = [tip1, tip2, tip3]
        let defaults = UserDefaults.standard
        defaults.set(tipPercentagesChanged, forKey: "key")
        defaults.synchronize()
        let tip = bill * (tipPercentagesChanged[tipControl.selectedSegmentIndex]) * 0.1
        let total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        */
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //print("view did disappear")
    }
    
}
