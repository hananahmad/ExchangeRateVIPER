//
//  CalculateCurrencyRouter.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/25/23.
//

import UIKit

class CalculateCurrencyRouter: PresenterToRouterCalculateCurrencyProtocol {
    
    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        
        let viewController = CalculateCurrencyViewController.instantiate(fromAppStoryboard: .CalculateCurrency)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: ViewToPresenterCalculateCurrencyProtocol & InteractorToPresenterCalculateCurrencyProtocol = CalculateCurrencyPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CalculateCurrencyRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CalculateCurrencyInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    // MARK: - Navigation
    
    func pushToCurrencyDetail(on view: PresenterToViewCalculateCurrencyProtocol, with rate: PairResponse, amountEntered: Double?) {
        let currencySummaryViewController = CurrencySummaryRouter.createModule(with: rate)
      
              let viewController = view as! CalculateCurrencyViewController
              viewController.navigationController?
                  .pushViewController(currencySummaryViewController, animated: true)
              
    }
    
}
