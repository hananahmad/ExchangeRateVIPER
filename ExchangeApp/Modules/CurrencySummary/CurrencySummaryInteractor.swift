//
//  CurrencySummaryInteractor.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/26/23.
//

import Foundation

class CurrencySummaryInteractor: PresenterToInteractorCurrencySummaryProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterCurrencySummaryProtocol?
    var pairResponse: PairResponse?

    
    func getCalculatedPairResponse() {
        self.presenter?.getPairResponseSuccess(pairResponse: self.pairResponse)
    }

}
