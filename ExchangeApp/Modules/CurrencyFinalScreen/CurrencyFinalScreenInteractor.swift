//
//  CurrencyFinalScreenInteractor.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/26/23.
//

import Foundation

class CurrencyFinalScreenInteractor: PresenterToInteractorCurrencyFinalScreenProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterCurrencyFinalScreenProtocol?
    var pairResponse: PairResponse?

    
    func getCalculatedPairResponse() {
        self.presenter?.getPairResponseSuccess(pairResponse: self.pairResponse)
    }

}
