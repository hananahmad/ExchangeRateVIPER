//
//  CurrencyFinalScreenPresenter.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/26/23.
//

import Foundation

class CurrencyFinalScreenPresenter: ViewToPresenterCurrencyFinalScreenProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewCurrencyFinalScreenProtocol?
    var interactor: PresenterToInteractorCurrencyFinalScreenProtocol?
    var router: PresenterToRouterCurrencyFinalScreenProtocol?
        
    // MARK: Inputs from view
    func viewDidLoad() {
        interactor?.getCalculatedPairResponse()
    }
}

// MARK: - Outputs to view
extension CurrencyFinalScreenPresenter: InteractorToPresenterCurrencyFinalScreenProtocol {
    func getPairResponseSuccess(pairResponse: PairResponse?) {
        self.view?.onPairResponseSuccess(pairResponse: pairResponse)
    }
    
}
