//
//  CurrencySummaryRouter.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/26/23.
//

import UIKit

class CurrencySummaryRouter: PresenterToRouterCurrencySummaryProtocol {
    
    
    // MARK: Static methods
    static func createModule(with pairResponse: PairResponse) -> UIViewController {
        
        let viewController = CurrencySummaryViewController.instantiate(fromAppStoryboard: .CurrencySummary)
        
        let presenter: ViewToPresenterCurrencySummaryProtocol & InteractorToPresenterCurrencySummaryProtocol = CurrencySummaryPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CurrencySummaryRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CurrencySummaryInteractor()
        viewController.presenter?.interactor?.pairResponse = pairResponse
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
        
        
    }
    
    // MARK: - Navigation
    func pushToCurrencyFinalDetail(on view: PresenterToViewCurrencySummaryProtocol, with rate: PairResponse) {
        let currencyFinalScreenViewController = CurrencyFinalScreenRouter.createModule(with: rate)
      
              let viewController = view as! CurrencySummaryViewController
              viewController.navigationController?
                  .pushViewController(currencyFinalScreenViewController, animated: true)
              
    }
}
