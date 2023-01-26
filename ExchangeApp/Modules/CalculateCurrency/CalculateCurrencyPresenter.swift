//
//  CalculateCurrencyPresenter.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/25/23.
//

import Foundation

class CalculateCurrencyPresenter: ViewToPresenterCalculateCurrencyProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewCalculateCurrencyProtocol?
    var interactor: PresenterToInteractorCalculateCurrencyProtocol?
    var router: PresenterToRouterCalculateCurrencyProtocol?
    
    var currencyStrings: [String]?
    var amountEntered: Double?
    
    
    // MARK: Inputs from view
    func viewDidLoad() {
        view?.showHUD()
        interactor?.loadCurrency()
    }
    
    func getCalculatedCurrencyAmount(with source: String, destination: String, amountEntered: Double) {
        view?.showHUD()
        self.amountEntered = amountEntered
        interactor?.calculateCurrency(sourceCurrency: source, destinationCurrency: destination, amountEntered: amountEntered)
    }
}

// MARK: - Outputs to view
extension CalculateCurrencyPresenter: InteractorToPresenterCalculateCurrencyProtocol {
    func fetchCalculatedRateSuccess(pair: PairResponse?) {
        view?.hideHUD()
        view?.onFetchCalculatedRateSuccess(pair: pair ?? PairResponse())
        router?.pushToCurrencyDetail(on: view!, with: pair ?? PairResponse(), amountEntered: amountEntered)
    }
    
    func fetchCalculatedRateFailure(errorCode: Int) {
        
    }

    func fetchCurrencySuccess(currencies: [String]) {
        self.currencyStrings = currencies
        view?.hideHUD()
        view?.onFetchCurrenciesSuccess(currencies: currencies)
    }
    
    func fetchCurrencyFailure(errorCode: Int) {
        view?.hideHUD()
        view?.onFetchCurrenciesFailure(error: "Could not find currencies: \(errorCode)")
    }
}
