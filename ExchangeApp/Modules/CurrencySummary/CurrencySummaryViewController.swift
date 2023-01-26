//
//  CurrencySummaryViewController.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/26/23.
//

import UIKit

class CurrencySummaryViewController: UIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterCurrencySummaryProtocol?
    var amountEntered: Double?

    // MARK: - IBOutlets
    @IBOutlet weak var destinationCurrencyLabel: UILabel!
    @IBOutlet weak var sourceCurrencyLabel: UILabel!
    
    // MARK: - ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        presenter?.viewDidLoad()
    }
}

//MARK: -- IBAction
extension CurrencySummaryViewController {
    @IBAction func convertAction(_ sender: Any) {
        self.presenter?.sendPairResponse()
    }
}

//MARK: -- PresenterToViewCurrencySummaryProtocol
extension CurrencySummaryViewController: PresenterToViewCurrencySummaryProtocol{
    func onPairResponseSuccess(pairResponse: PairResponse?) {
        // show response
        self.sourceCurrencyLabel.text = "\(self.amountEntered ?? 1) \(pairResponse?.base_code ?? "")"
        self.destinationCurrencyLabel.text = "\(pairResponse?.conversion_result ?? 0.0) \(pairResponse?.target_code ?? "")"
    }
    
}

// MARK: - UI Setup
extension CurrencySummaryViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light

        self.navigationItem.title = "Currency Calculate"
    }
}
