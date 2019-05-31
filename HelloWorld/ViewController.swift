//
//  ViewController.swift
//  HelloWorld
//
//  Created by Li, Sida on 29/5/19.
//  Copyright © 2019 Sida Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // let vs var, let in Swift is not same as let in Javascript
    var passwordPopup: UIAlertController?
    
    @IBOutlet weak var labelPassword: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Hello World")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        passwordPopup = UIAlertController.init(title: "Hello World", message: "Hello World", preferredStyle: .alert)
        passwordPopup!.addAction(UIAlertAction.init(title: "Dismiss", style: .cancel, handler: { action in
            print("we dismissed the alert")
        }))
        passwordPopup!.addTextField(configurationHandler: { textfield in
            textfield.placeholder = "password"
            textfield.text = nil
        })
        passwordPopup!.addAction(UIAlertAction.init(title: "Save", style: .default, handler: { action in
            guard let textfields = self.passwordPopup!.textFields, let text = textfields[0].text, text.firstIndex(of: " ") == nil else {
                print("invalid password")
                return
            }
            
            print("the user password is \(text)")
            
            // always update UI in main thread
            DispatchQueue.main.async {
                self.labelPassword.text = text
            }
        }))
    }
    
    @IBAction func onTapButtonShow(_ sender: UIButton) {
        if let popup = passwordPopup {
            self.present(popup, animated: true, completion: {
                print("the alert is showing now")
            })
        } else {
            print("popup is not initialised")
        }
    }
    
}

