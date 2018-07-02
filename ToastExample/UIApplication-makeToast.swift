//
//  UIApplication-makeToast.swift
//  ToastExample
//
//  Created by Kevin Scardina on 7/2/18.
//  Copyright © 2018 Kevin Scardina. All rights reserved.
//

import UIKit

extension UIApplication {
/**
 Makes a "Toast" like in Android.
 - Parameter message: string to display in toast
 - Parameter duration: time interval to show the toast, defaults to 4 seconds
 - Parameter frame: x, y point and width, height of toast, defaults to bottom center
 - Parameter backgroundColor: color to make the background of toast, defaults to gray
 - Parameter textColor: color of the text in the toast, defaults to white
 - Parameter textAlignment: alignment of the text in the toast, defaults to center
 - Parameter font: font to use for the toast, defaults to system font (size 12)
 - Parameter alpha: alpha of the toast, defaults to 1.0 (solid)
 - Parameter cornerRadius: radius of the toast corners, defaults to 10.0 pt
 - Parameter completion: func to run when toast is complete, defaults to nil
 */
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
        if let viewController = self.getTopViewController(self.delegate?.window??.rootViewController) {
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
            print("Unable to get top view controller.")
        }
    }
    
    private func getTopViewController(_ viewController: UIViewController?) -> UIViewController? {
        if let tabBarViewController = viewController as? UITabBarController {
            return getTopViewController(tabBarViewController.selectedViewController)
        } else if let navigationController = viewController as? UINavigationController {
            return getTopViewController(navigationController.visibleViewController)
        } else if let presentedViewController = viewController?.presentedViewController {
            return getTopViewController(presentedViewController)
        } else {
            return viewController
        }
    }
}
