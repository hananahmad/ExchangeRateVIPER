//
//  CalculateCurrencyInteractor.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/25/23.
//

import Foundation

class CalculateCurrencyInteractor: PresenterToInteractorCalculateCurrencyProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterCalculateCurrencyProtocol?
    
    var currencies: [Currency]?
    
    func loadCurrency() {
        CurrencyService.shared.getCurrencies { [weak self] currencies in
            self?.presenter?.fetchCurrencySuccess(currencies: currencies)
        } failure: { code in
            self.presenter?.fetchCurrencyFailure(errorCode: code)
        }

    }
    
    func calculateCurrency(sourceCurrency: String, destinationCurrency: String, amountEntered: Double) {
        CurrencyService.shared.calculateCurrency(sourceCurrency: sourceCurrency, destinationCurrency: destinationCurrency, amountEntered: amountEntered) { [weak self] pairResponse in
            self?.presenter?.fetchCalculatedRateSuccess(pair: pairResponse)
        } failure: { code in
            self.presenter?.fetchCalculatedRateFailure(errorCode: code)
        }


    }

}
