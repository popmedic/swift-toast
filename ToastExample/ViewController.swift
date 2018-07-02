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

    @IBAction func demoButtonAction(_ sender: Any) {
        Toast.backgroundColor = UIColor.init(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.6)
        Toast.textColor = UIColor.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        Toast.textAlignment = .left
        Toast.font = UIFont.systemFont(ofSize: 14.0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            Toast.makeToast(message: "This is a test", duration: 10.0) { (isComplete) in
                print("complete")
            }
        }
        self.performSegue(withIdentifier: "DemoSegueIdentifier", sender: self)
    }
    
}

