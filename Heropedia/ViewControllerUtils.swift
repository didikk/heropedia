//
//  ViewControllerUtils.swift
//  Heropedia
//
//  Created by Didik Ismawanto on 9/21/17.
//  Copyright © 2017 Didik Ismawanto. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class ViewControllerUtils {
    
    private var container: UIView = UIView()
    private var loadingView: UIView = UIView()
    private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    private var parent: UIView
    
    init(_ uiView: UIView) {
        parent = uiView
        
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColorFromHex(rgbValue: 0xffffff, alpha: 0.3)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColorFromHex(rgbValue: 0x444444, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.center = CGPoint(x:loadingView.frame.size.width / 2, y:loadingView.frame.size.height / 2)
    }
    
    /*
     Show customized activity indicator,
     actually add activity indicator to passing view
     
     @param uiView - add activity indicator to this view
     */
    func showActivityIndicator() {
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        parent.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    /*
     Hide activity indicator
     Actually remove activity indicator from its super view
     
     @param uiView - remove activity indicator from this view
     */
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
    /*
     Define UIColor from hex value
     
     @param rgbValue - hex color value
     @param alpha - transparency level
     */
     func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
}

//// In order to show the activity indicator, call the function from your view controller
//// ViewControllerUtils().showActivityIndicator(self.view)
//// In order to hide the activity indicator, call the function from your view controller
//// ViewControllerUtils().hideActivityIndicator(self.view)
