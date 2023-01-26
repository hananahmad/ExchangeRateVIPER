//
//  CurrencySummaryContract.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/26/23.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewCurrencySummaryProtocol: AnyObject {
    func onPairResponseSuccess(pairResponse: PairResponse?)
    
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCurrencySummaryProtocol: AnyObject {
    
    var view: PresenterToViewCurrencySummaryProtocol? { get set }
    var interactor: PresenterToInteractorCurrencySummaryProtocol? { get set }
    var router: PresenterToRouterCurrencySummaryProtocol? { get set }
    
    func viewDidLoad()
    
    func sendPairResponse()

}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCurrencySummaryProtocol: AnyObject {
    
    var presenter: InteractorToPresenterCurrencySummaryProtocol? { get set }
    var pairResponse: PairResponse? { get set }

    func getCalculatedPairResponse()
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCurrencySummaryProtocol: AnyObject {
    
    func getPairResponseSuccess(pairResponse: PairResponse?)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCurrencySummaryProtocol: AnyObject {
    
    static func createModule(with pairResponse: PairResponse) -> UIViewController
    
    func pushToCurrencyFinalDetail(on view: PresenterToViewCurrencySummaryProtocol, with rate: PairResponse)
}
