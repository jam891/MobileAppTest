//
//  CarViewController.swift
//  MobileAppTest
//
//  Created by Vitaliy Delidov on 7/22/15.
//  Copyright (c) 2015 Vitaliy Delidov. All rights reserved.
//

import UIKit

protocol CarViewControllerDelegate {
    func loadPreviousPage()
    func loadNextPage()
}

class CarViewController: UIViewController {

    @IBOutlet weak var switch1: SevenSwitch!
    @IBOutlet weak var switch2: SevenSwitch!
    
    var delegate: CarViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributes = [
            NSFontAttributeName: UIFont(name: "Avenir-Black", size: 12)!,
            NSForegroundColorAttributeName: UIColor.whiteColor(),
        ]
        
        switch1.offLabel.attributedText = NSAttributedString(string: "NO", attributes: attributes)
        switch1.onLabel.attributedText = NSAttributedString(string: "YES", attributes: attributes)
        
        switch2.offLabel.attributedText = NSAttributedString(string: "NO", attributes: attributes)
        switch2.onLabel.attributedText = NSAttributedString(string: "YES", attributes: attributes)
    }
    
    // MARK: - Actions
    
    @IBAction func didTapNextButton(sender: UIButton) {
        
    }
    
    @IBAction func didTapBackButton(sender: UIButton) {
        delegate?.loadPreviousPage()
    }


}
