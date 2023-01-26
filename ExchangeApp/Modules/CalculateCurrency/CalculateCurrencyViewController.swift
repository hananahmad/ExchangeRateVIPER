//
//  CalculateCurrencyViewController.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/25/23.
//

import UIKit

enum SourceType {
    case source
    case destination
}

class CalculateCurrencyViewController: UIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterCalculateCurrencyProtocol?
    var currencies = [String]()
    var picker: UIPickerView?
    var currencySource: SourceType? = .source
    
    var pairResponse: PairResponse?
    
    // MARK: - IBOutlets
    @IBOutlet weak var destinationCurrencyLabel: UILabel!
    @IBOutlet weak var sourceCurrencyLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!

    // MARK: - ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        presenter?.viewDidLoad()
    }
}

//MARK: -- IBAction
extension CalculateCurrencyViewController {
    @IBAction func sourceCurrencyAction(_ sender: Any) {
        if let picker = self.picker {
            picker.removeFromSuperview()
        }
        
        self.currencySource = .source
        setupCurrencyPicker()
    }
    
    @IBAction func destinationCurrencyAction(_ sender: Any) {
        if let picker = self.picker {
            picker.removeFromSuperview()
        }
        
        self.currencySource = .destination
        setupCurrencyPicker()
    }
    
    @IBAction func calculateAction(_ sender: Any) {
        if let sourceCurrency = self.sourceCurrencyLabel.text, let targetCurrency = self.destinationCurrencyLabel.text, !sourceCurrency.isEmpty, !targetCurrency.isEmpty {
            self.presenter?.getCalculatedCurrencyAmount(with: sourceCurrency, destination: targetCurrency, amountEntered: Double(self.amountTextField.text ?? "1.0") ?? 1.0)
        }
    }
}

//MARK: -- PresenterToViewCalculateCurrencyProtocol
extension CalculateCurrencyViewController: PresenterToViewCalculateCurrencyProtocol{
    func onFetchCalculatedRateSuccess(pair: PairResponse) {
        self.pairResponse = pair
    }
    
    func onFetchCalculatedRateFailure(error: String) {
        print("\(error)")
    }
    
    
    func onFetchCurrenciesSuccess(currencies: [String]) {
        self.currencies = currencies
    }
    
    func onFetchCurrenciesFailure(error: String) {
        print("\(error)")
    }
    
    func showHUD() {
        
    }
    
    func hideHUD() {
        
    }
    
}

// MARK: - UI Setup
extension CalculateCurrencyViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light

        self.navigationItem.title = "Currency Calculate"
    }
    
    func setupCurrencyPicker() {
        picker = UIPickerView()
        picker?.delegate = self
        picker?.dataSource = self
        picker?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picker ?? UIPickerView())

        picker?.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        picker?.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        picker?.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

//MARK: -- UIPickerViewDelegate
extension CalculateCurrencyViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.currencies.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let selectedCurrency = self.currencies[row]
        return "\(selectedCurrency)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = self.currencies[row]
        switch self.currencySource {
        case .source:
            self.sourceCurrencyLabel.text = selectedCurrency
        case .destination:
            self.destinationCurrencyLabel.text = selectedCurrency
        default:
            break
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.picker?.removeFromSuperview()
        }
    }
}
