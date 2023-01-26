//
//  CurrencyFinalScreenRouter.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/26/23.
//

import UIKit

class CurrencyFinalScreenRouter: PresenterToRouterCurrencyFinalScreenProtocol {
    
    
    // MARK: Static methods
    static func createModule(with pairResponse: PairResponse) -> UIViewController {
        
        let viewController = CurrencyFinalScreenViewController.instantiate(fromAppStoryboard: .CurrencyFinalScreen)
        
        let presenter: ViewToPresenterCurrencyFinalScreenProtocol & InteractorToPresenterCurrencyFinalScreenProtocol = CurrencyFinalScreenPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CurrencyFinalScreenRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CurrencyFinalScreenInteractor()
        viewController.presenter?.interactor?.pairResponse = pairResponse
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
        
        
    }
        
}
