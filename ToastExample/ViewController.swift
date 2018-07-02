//
//  ViewController.swift
//  ToastExample
//
//  Created by Kevin Scardina on 7/2/18.
//  Copyright © 2018 Kevin Scardina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

/**
 Action for when the demo button for Toast static class is pressed
 */
    @IBAction func demoButtonAction(_ sender: Any) {
        Toast.backgroundColor = UIColor.init(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.6)
        Toast.textColor = UIColor.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.6)
        Toast.textAlignment = .center
        Toast.font = UIFont.systemFont(ofSize: 14.0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            Toast.makeToast(message: "This is a test", duration: 4.0) { (isCompleted) in
                print("completed: \(isCompleted)")
            }
        }
        self.performSegue(withIdentifier: "DemoSegueIdentifier", sender: self)
    }
    
/**
 Action for when the demo button for UIApplication extension, makeToast, is pressed
 */
    @IBAction func demo2ButtonAction(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            UIApplication.shared.makeToast(message: "This is another test", duration: 4.0) { (isCompleted) in
                print("completed: \(isCompleted)")
            }
        }
        self.performSegue(withIdentifier: "DemoSegueIdentifier", sender: self)
    }
}

