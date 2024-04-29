//
//  ViewController.swift
//  UserDefaultApp
//
//  Created by Sinda Arous on 1/4/2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {


    
    @IBOutlet weak var switchView: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        let isOn = UserDefaults.standard.bool(forKey: "switchIsOn")
        updateBackground(isOn: isOn)
       
        // Do any additional setup after loading the view.
    }
  
        
      /*  if let inputText = userDefaulte.value(forKey: inputTextKey) as? String{
            
        }*/
    
    
    @IBAction func switchToggel(_ sender: UISwitch) {
        updateBackground(isOn: sender.isOn)
        UserDefaults.standard.setValue(sender.isOn, forKey: "switchIsOn")
    }
    private func updateBackground(isOn: Bool)
    {
        view.backgroundColor = isOn ? .orange : .darkGray
        switchView.isOn = isOn
       
    }
}


