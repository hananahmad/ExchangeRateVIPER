//
//  UIViewController+Instantiatable.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/26/23.
//

import UIKit

// MARK: - extension

extension UIViewController {
    // MARK: properties
    
    // UIViewController storyboard ID
    static var storyboardID: String {
        return "\(self)"
    }
    
    // MARK: - Handler method
    
    // instatiate UIViewController instance
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    // MARK: enum
    
    // Storyboard name
    enum AppStoryboard: String {
        case CalculateCurrency
        case CurrencySummary
        case CurrencyFinalScreen
        
        
        var instance: UIStoryboard {
            return UIStoryboard(name: rawValue, bundle: Bundle.main)
        }
        
        func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
            
            let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
            return self.instance.instantiateViewController(withIdentifier: storyboardID) as! T
        }
        
        func initialViewController() -> UIViewController? {
            return self.instance.instantiateInitialViewController()
        }
    }
}
