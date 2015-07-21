//
//  EmailViewController.swift
//  MobileApp
//
//  Created by Vitaliy Delidov on 7/10/15.
//  Copyright (c) 2015 Vitaliy Delidov. All rights reserved.
//

import UIKit

protocol EmailViewControllerDelegate {
    func loadNextPage()
}

class EmailViewController: UIViewController {
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var confirmEmailAddressTextField: UITextField!
    
    var delegate: EmailViewControllerDelegate?
    
    
    // MARK: - Actions
    
    @IBAction func didTapNextButton(sender: UIButton) {
        delegate?.loadNextPage()
    }
}
