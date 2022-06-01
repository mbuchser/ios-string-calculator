//
//  ViewController.swift
//  StringCalc
//
//  Created by Marc Buchser on 26.05.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var inputField: UITextField!
    @IBOutlet var resultTextfield: UITextField!
    @IBAction func calculate(_ sender: Any) {
       
        errorLabel.text = ""
        guard inputField.text != "" else {
            resultTextfield.text = "Input needed (eg 1,2,3)"
            return
        }
        var result = 0
        do {
            try result = StringCalculator.add(inputField.text!)
            } catch {
                errorLabel.text = error.localizedDescription
                print(error)
            }
        resultTextfield.text = String(result)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

