//
//  CurrencyService.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/25/23.
//

import Foundation

class CurrencyService {
    
    static let shared = { CurrencyService() }()
    
    func getCurrencies(success: @escaping ([String]) -> (), failure: @escaping (Int) -> ()) {
        let currencies = Currency.allNamesForCountries
        success(currencies)
    }
    
    func calculateCurrency(sourceCurrency: String, destinationCurrency: String , amountEntered: Double,success: @escaping (PairResponse) -> (), failure: @escaping (Int) -> ()) {
        let url = self.configureApiCall(Endpoints.BaseURL, "\(Endpoints.APIKey)/\(Endpoints.CalculateCurrency)/\(sourceCurrency)/\(destinationCurrency)/\(amountEntered)")
        
        ApiService.shared.fetchApiData(urlString: url) { (rates: PairResponse?, error: ErrorModel?) in
            if let error = error {
                print(error)
            }
            guard let rates = rates else { return }
            success(rates)
        }

    }
    
    func configureApiCall(_ baseURL: String, _ parameter: String) -> String {
        return baseURL + parameter
    }
}
