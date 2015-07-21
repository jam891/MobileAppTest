//
//  PersonalViewController.swift
//  MobileApp
//
//  Created by Vitaliy Delidov on 7/10/15.
//  Copyright (c) 2015 Vitaliy Delidov. All rights reserved.
//

import UIKit

protocol PersonalViewControllerDelegate {
    func loadPreviousPage()
    func loadNextPage()
}

class PersonalViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var countryOfResidenceTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var customerTypeTextField: UITextField!
    
    var delegate: PersonalViewControllerDelegate?
    
    // MARK: - Actions
    
    @IBAction func didTapNextButton(sender: UIButton) {
        delegate?.loadNextPage()
    }
    
    @IBAction func didTapBackButton(sender: UIButton) {
        delegate?.loadPreviousPage()
    }
}
