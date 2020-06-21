//
//  ViewController.swift
//  veraID-sdk-ios
//
//  Created by lagrunge on 06/05/2020.
//  Copyright (c) 2020 lagrunge. All rights reserved.
//

import UIKit
import VeraIdSdk

class ViewController: UIViewController {

    @IBOutlet weak var resultsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VeraID.shared.partnerId = 399
        VeraID.shared.delegate = self
        resultsTextView.text = nil
    }

    @IBAction func signInAction(_ sender: Any) {
        resultsTextView.text = "Authenticating..."
        VeraID.shared.authenticate(requesting: [.fio, .email__value, .driver_license__expiry_date])
    }
    
    private func requestVeraIdUser(token: String) {
        resultsTextView.text = "Token: \(token)\nRequesting user data..."
        VeraID.shared.veraIdUser(token: token) { result in
            switch result {
            case .success(let dict):
                print(dict)
                self.resultsTextView.text = String(describing: dict)
            case .failure(let error):
                print(error)
                self.resultsTextView.text = String(describing: error)
            }
        }
    }
}

extension ViewController: VeraIdDelegate {
    func veraIdAuhentication(result: Result<String, VeraIdError>) {
        switch result {
        case .success(let token):
            print(token)
            requestVeraIdUser(token: token)
        case .failure(let error):
            print(error)
            self.resultsTextView.text = String(describing: error)
        }
    }
}

