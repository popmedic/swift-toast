//
//  Toast.swift
//  ToastExample
//
//  Created by Kevin Scardina on 7/2/18.
//  Copyright © 2018 Kevin Scardina. All rights reserved.
//

import UIKit

/**
 Class to make "Toast," like in Android, for iOS in Swift 4.x.
 */
public class Toast {
    private init() { }
/**
 x, y point and width, height of toast, defaults to bottom center
 */
    public static var frame = CGRect(
        x: UIScreen.main.bounds.size.width/2 - (UIScreen.main.bounds.size.width/2 - 16),
        y: UIScreen.main.bounds.size.height - 100,
        width: UIScreen.main.bounds.size.width - 32,
        height: 35
    )
/**
 color to make the background of toast, defaults to gray
 */
    public static var backgroundColor = UIColor.black.withAlphaComponent(0.6)
/**
 color of the text in the toast, defaults to white
 */
    public static var textColor = UIColor.white
/**
 alignment of the text in the toast, defaults to center
 */
    public static var textAlignment = NSTextAlignment.center
/**
 font to use for the toast, defaults to system font (size 12)
 */
    public static var font = UIFont.systemFont(ofSize: 12.0)
/**
 alpha of the toast, defaults to 1.0 (solid)
 */
    public static var alpha:CGFloat = 1.0
/**
 radius of the toast corners, defaults to 10.0 pt
 */
    public static var cornerRadius:CGFloat = 10.0;
/**
 Makes a "Toast" like in Android.
 - Parameter message: string to display in toast
 - Parameter duration: time interval to show the toast, defaults to 4 seconds
 - Parameter completion: func to run when toast is complete, defaults to nil
 */
    public static func makeToast(
        message: String,
        duration: TimeInterval = 4.0,
        completion: ((_ complete:Bool)->Void)? = nil
    ) {
        if let viewController = getTopViewController() {
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
            print("Unable to get top view controller.")
        }
    }
    
    private static func getTopViewController(_ viewController: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController? {
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
