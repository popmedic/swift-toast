//
//  Toast.swift
//  ToastExample
//
//  Created by Kevin Scardina on 7/2/18.
//  Copyright © 2018 Kevin Scardina. All rights reserved.
//

import UIKit

public class Toast {
    private init() { }
    
    public static var frame = CGRect(
        x: UIScreen.main.bounds.size.width/2 - (UIScreen.main.bounds.size.width/2 - 16),
        y: UIScreen.main.bounds.size.height - 100,
        width: UIScreen.main.bounds.size.width - 32,
        height: 35
    )
    public static var backgroundColor = UIColor.black.withAlphaComponent(0.6)
    public static var textColor = UIColor.white
    public static var textAlignment = NSTextAlignment.center
    public static var font = UIFont(name: "Montserrat-Light", size: 12.0)
    public static var alpha:CGFloat = 1.0
    public static var cornerRadius:CGFloat = 10.0;
    
    public static func makeToast(
        message: String,
        duration: TimeInterval = 4.0,
        completion: ((_ complete:Bool)->Void)? = nil
    ) {
        if let viewController = UIApplication.shared.delegate?.window??.rootViewController {
            let toastLabel = UILabel(frame: Toast.frame)
            toastLabel.backgroundColor = Toast.backgroundColor
            toastLabel.textColor = Toast.textColor
            toastLabel.textAlignment = Toast.textAlignment;
            toastLabel.font = Toast.font
            toastLabel.alpha = Toast.alpha
            toastLabel.layer.cornerRadius = Toast.cornerRadius
            toastLabel.clipsToBounds  =  true
            
            toastLabel.text = message
            
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
