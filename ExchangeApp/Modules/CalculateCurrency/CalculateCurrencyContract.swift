//
//  CalculateCurrencyContract.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/25/23.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewCalculateCurrencyProtocol: AnyObject {
    func onFetchCurrenciesSuccess(currencies: [String])
    func onFetchCurrenciesFailure(error: String)
    
    func onFetchCalculatedRateSuccess(pair: PairResponse)
    func onFetchCalculatedRateFailure(error: String)
    
    func showHUD()
    func hideHUD()
    
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCalculateCurrencyProtocol: AnyObject {
    
    var view: PresenterToViewCalculateCurrencyProtocol? { get set }
    var interactor: PresenterToInteractorCalculateCurrencyProtocol? { get set }
    var router: PresenterToRouterCalculateCurrencyProtocol? { get set }
    
    var currencyStrings: [String]? { get set }
    
    func viewDidLoad()
    
    func getCalculatedCurrencyAmount(with source: String, destination: String, amountEntered: Double)

}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCalculateCurrencyProtocol: AnyObject {
    
    var presenter: InteractorToPresenterCalculateCurrencyProtocol? { get set }
    
    func loadCurrency()
    
    func calculateCurrency(sourceCurrency: String, destinationCurrency: String, amountEntered: Double)
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCalculateCurrencyProtocol: AnyObject {
    
    func fetchCurrencySuccess(currencies: [String])
    func fetchCurrencyFailure(errorCode: Int)
    
    func fetchCalculatedRateSuccess(pair: PairResponse?)
    func fetchCalculatedRateFailure(errorCode: Int)
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCalculateCurrencyProtocol: AnyObject {
    
    static func createModule() -> UINavigationController
    
    func pushToCurrencyDetail(on view: PresenterToViewCalculateCurrencyProtocol, with rate: PairResponse, amountEntered: Double?)
}
