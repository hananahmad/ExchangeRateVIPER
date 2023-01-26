//
//  CurrencySummaryPresenter.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/26/23.
//

import Foundation

class CurrencySummaryPresenter: ViewToPresenterCurrencySummaryProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewCurrencySummaryProtocol?
    var interactor: PresenterToInteractorCurrencySummaryProtocol?
    var router: PresenterToRouterCurrencySummaryProtocol?
    var pairResponse: PairResponse?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        interactor?.getCalculatedPairResponse()
    }
    
    func sendPairResponse() {
        router?.pushToCurrencyFinalDetail(on: view!, with: self.pairResponse ?? PairResponse())
    }
}

// MARK: - Outputs to view
extension CurrencySummaryPresenter: InteractorToPresenterCurrencySummaryProtocol {
    func getPairResponseSuccess(pairResponse: PairResponse?) {
        self.pairResponse = pairResponse
        self.view?.onPairResponseSuccess(pairResponse: pairResponse)
    }
    
}
