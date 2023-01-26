//
//  CurrencyFinalScreenViewController.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/26/23.
//

import UIKit

class CurrencyFinalScreenViewController: UIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterCurrencyFinalScreenProtocol?
    var amountEntered: Double?

    // MARK: - IBOutlets
    @IBOutlet weak var accountInfoLabel: UILabel!
    @IBOutlet weak var conversionRateLabel: UILabel!
    
    // MARK: - ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(doneAction))
        presenter?.viewDidLoad()
    }
    
    @objc func doneAction() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

//MARK: -- PresenterToViewCurrencyFinalScreenProtocol
extension CurrencyFinalScreenViewController: PresenterToViewCurrencyFinalScreenProtocol{
    func onPairResponseSuccess(pairResponse: PairResponse?) {
        
        accountInfoLabel.text = "Great now you have \(pairResponse?.conversion_result ?? 0.0) \(pairResponse?.target_code ?? "") in your account"
        conversionRateLabel.text = "Your conversion rate was 1/\(pairResponse?.conversion_rate ?? 0.0)"
    }
    
}

// MARK: - UI Setup
extension CurrencyFinalScreenViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light

    }
}
