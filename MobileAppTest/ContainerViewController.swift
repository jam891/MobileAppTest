//
//  ContainerViewController.swift
//  MobileAppTest
//
//  Created by Vitaliy Delidov on 7/21/15.
//  Copyright (c) 2015 Vitaliy Delidov. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    var controllerArray = [UIViewController]()
    var currentPageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize view controllers to display and place in array
        
        var emailViewController = UIStoryboard.emailViewController()!
        emailViewController.delegate = self
        
        var personalViewController = UIStoryboard.personalViewController()!
        personalViewController.delegate = self
        
        var vinViewController = UIStoryboard.vinViewController()!
        vinViewController.delegate = self

        controllerArray = [
            emailViewController,
            personalViewController,
            vinViewController
        ]
        
        view.addSubview(controllerArray[currentPageIndex].view)
        
        let indicator = IndicatorView(frame: CGRectMake(0, 145, view.frame.width, 90))
        navigationController?.view.addSubview(indicator)
    }
}

extension ContainerViewController:
    EmailViewControllerDelegate,
    PersonalViewControllerDelegate,
    VinViewControllerDelegate {
    
    func loadPreviousPage() {
        if currentPageIndex > 0 {
            navigationController?.popViewControllerAnimated(true)
            --currentPageIndex
        }
    }
    
    func loadNextPage() {
        if currentPageIndex < controllerArray.count {
            ++currentPageIndex
            navigationController?.pushViewController(controllerArray[currentPageIndex], animated: true)
        }
    }
    
}



// MARK: - Storyboard

private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    }
    
    class func emailViewController() -> EmailViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("EmailViewController") as? EmailViewController
    }
    
    class func personalViewController() -> PersonalViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("PersonalViewController") as? PersonalViewController
    }
    
    class func vinViewController() -> VinViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("VinViewController") as? VinViewController
    }
    
}


