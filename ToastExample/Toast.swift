//
//  Toast.swift
//  ToastExample
//
//  Created by Kevin Scardina on 7/2/18.
//  Copyright © 2018 Kevin Scardina. All rights reserved.
//

import UIKit

public class Toast {
    public static var frame = CGRect(
        x: UIScreen.main.bounds.size.width/2 - 75,
        y: UIScreen.main.bounds.size.height - 100,
        width: 150,
        height: 35
    )
    
    public static var backgroundColor = UIColor.black.withAlphaComponent(0.6)
    public static var textColor = UIColor.white
    public static var textAlignment = NSTextAlignment.center
    public static var font = UIFont(name: "Montserrat-Light", size: 12.0)
    
    private init() {
        
    }
    
    public static func makeToast(
        message: String,
        duration: TimeInterval = 4.0,
        _ completion: ((_ complete:Bool)->Void)? = nil
    ) {
        if let viewController = UIApplication.shared.delegate?.window??.rootViewController {
            let toastLabel = UILabel(frame: Toast.frame)
            toastLabel.backgroundColor = Toast.backgroundColor
            toastLabel.textColor = Toast.textColor
            toastLabel.textAlignment = Toast.textAlignment;
            toastLabel.font = Toast.font
            
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds  =  true
            
            viewController.view.addSubview(toastLabel)
            UIView.animate(withDuration: 0.4, delay: duration, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
                completion?(isCompleted)
            })
        } else {
            print("Unable to get root view controller.")
        }
    }
    
}
