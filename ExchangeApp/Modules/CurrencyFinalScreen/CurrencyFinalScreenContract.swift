//
//  CurrencyFinalScreenContract.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/26/23.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewCurrencyFinalScreenProtocol: AnyObject {
    func onPairResponseSuccess(pairResponse: PairResponse?)
    
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCurrencyFinalScreenProtocol: AnyObject {
    
    var view: PresenterToViewCurrencyFinalScreenProtocol? { get set }
    var interactor: PresenterToInteractorCurrencyFinalScreenProtocol? { get set }
    var router: PresenterToRouterCurrencyFinalScreenProtocol? { get set }
    
    func viewDidLoad()

}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCurrencyFinalScreenProtocol: AnyObject {
    
    var presenter: InteractorToPresenterCurrencyFinalScreenProtocol? { get set }
    var pairResponse: PairResponse? { get set }

    func getCalculatedPairResponse()
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCurrencyFinalScreenProtocol: AnyObject {
    
    func getPairResponseSuccess(pairResponse: PairResponse?)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCurrencyFinalScreenProtocol: AnyObject {
    
    static func createModule(with pairResponse: PairResponse) -> UIViewController
    
}
