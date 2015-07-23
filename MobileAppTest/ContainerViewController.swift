//
//  ContainerViewController.swift
//  MobileAppTest
//
//  Created by Vitaliy Delidov on 7/21/15.
//  Copyright (c) 2015 Vitaliy Delidov. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var emailViewController: EmailViewController!
    var personalViewController: PersonalViewController!
    var vinViewController: VinViewController!
    var carViewController: CarViewController!
    
    var indicator: IndicatorView!
    var steps: [IndicatorItem]!
    var textLabels: [UILabel]!
    
    let color = UIColor.whiteColor()

    var controllerArray = [UIViewController]()
    var currentPageIndex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        emailViewController = UIStoryboard.emailViewController()!
        emailViewController.delegate = self
        controllerArray.append(emailViewController)
        
        personalViewController = UIStoryboard.personalViewController()!
        personalViewController.delegate = self
        controllerArray.append(personalViewController)
        
        vinViewController = UIStoryboard.vinViewController()!
        vinViewController.delegate = self
        controllerArray.append(vinViewController)
        
        carViewController = UIStoryboard.carViewController()!
        carViewController.delegate = self
        controllerArray.append(carViewController)
        
        view.addSubview(controllerArray[currentPageIndex].view)
        
        let frame = CGRectMake(0, 145, view.frame.width, 90)
        indicator = IndicatorView(frame: frame)
        
        steps = [
            indicator.step1,
            indicator.step2,
            indicator.step3,
            indicator.step4
        ]
        
        textLabels = [
            indicator.emailLabel,
            indicator.personalLabel,
            indicator.vinLabel,
            indicator.carLabel
        ]
        
        steps[currentPageIndex].state = .Show
        textLabels[currentPageIndex].textColor = color
        
        navigationController?.view.addSubview(indicator)
    }
    
    
}

// MARK: - Delegate methods

extension ContainerViewController:
    EmailViewControllerDelegate,
    PersonalViewControllerDelegate,
    VinViewControllerDelegate,
    CarViewControllerDelegate {
    
    func loadPreviousPage() {
        if currentPageIndex > 0 {
            --currentPageIndex
            setIndicatorFrameForPage(currentPageIndex)
            navigationController?.popViewControllerAnimated(true)
        }
    }
    
    func loadNextPage() {
        if currentPageIndex < controllerArray.count {
            steps[currentPageIndex].state = .Checked
            
            ++currentPageIndex
            setIndicatorFrameForPage(currentPageIndex)
            
            if steps[currentPageIndex].state != .Checked {
                steps[currentPageIndex].state = .Show
            }
            textLabels[currentPageIndex].textColor = color
    
            navigationController?.pushViewController(controllerArray[currentPageIndex], animated: true)
        }
    }
    
    func setIndicatorFrameForPage(index: Int) {
        var frame = indicator.frame
        
        switch index {
        case 0: break
        case 1:
            if frame.origin.y > 145 {
                frame.origin.y -= 275
            }
        case 2:
            if frame.origin.y > 145 {
                frame.origin.y += 100
            } else {
                frame.origin.y += 275
            }
        case 3:
            frame.origin.y -= 100
        default: break
        }
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.indicator.frame = frame
        })
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
    
    class func carViewController() -> CarViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("CarViewController") as? CarViewController
    }
    
}


