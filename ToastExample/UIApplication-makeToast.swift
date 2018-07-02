//
//  UIApplication-makeToast.swift
//  ToastExample
//
//  Created by Kevin Scardina on 7/2/18.
//  Copyright © 2018 Kevin Scardina. All rights reserved.
//

import UIKit

extension UIApplication {
    public func makeToast(
        message: String,
        duration: TimeInterval = 4.0,
        frame:CGRect = CGRect(
            x: UIScreen.main.bounds.size.width/2 - (UIScreen.main.bounds.size.width/2 - 16),
            y: UIScreen.main.bounds.size.height - 100,
            width: UIScreen.main.bounds.size.width - 32,
            height: 35
        ),
        backgroundColor:UIColor = UIColor.black.withAlphaComponent(0.6),
        textColor:UIColor = UIColor.white,
        textAlignment:NSTextAlignment = .center,
        font:UIFont = UIFont.systemFont(ofSize: 12.0),
        alpha:CGFloat = 1.0,
        cornerRadius:CGFloat = 10,
        completion: ((_ complete:Bool)->Void)? = nil
    ) {
        if let viewController = self.delegate?.window??.rootViewController {
            let toastLabel = UILabel(frame: frame)
            toastLabel.backgroundColor = backgroundColor
            toastLabel.textColor = textColor
            toastLabel.textAlignment = textAlignment;
            toastLabel.font = font
            toastLabel.alpha = alpha
            toastLabel.layer.cornerRadius = cornerRadius
            toastLabel.clipsToBounds = true
            
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
