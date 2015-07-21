//
//  UIView+Borders.swift
//  MobileApp
//
//  Created by Vitaliy Delidov on 7/10/15.
//  Copyright (c) 2015 Vitaliy Delidov. All rights reserved.
//

import UIKit

// MARK: - UIView

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(CGColor: layer.borderColor)
        }
        set {
            layer.borderColor = newValue?.CGColor
        }
    }
    
    @IBInspectable var leftBorderWidth: CGFloat {
        get {
            return 0.0
        }
        set {
            let line = UIView(frame: CGRect(x: 0.0, y: 0.0, width: newValue, height: bounds.height))
            line.setTranslatesAutoresizingMaskIntoConstraints(false)
            line.backgroundColor = UIColor(CGColor: layer.borderColor)
            addSubview(line)
            
            let views: [NSObject : AnyObject] = ["line" : line]
            let metrics: [NSObject : AnyObject] = ["lineWidth" : newValue]
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[line(==lineWidth)]",
                options: nil, metrics: metrics, views: views))
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[line]|",
                options: nil, metrics: nil, views: views))
        }
    }
    
    @IBInspectable var topBorderWidth: CGFloat {
        get {
            return 0.0
        }
        set {
            let line = UIView(frame: CGRect(x: 0.0, y: 0.0, width: bounds.width, height: newValue))
            line.setTranslatesAutoresizingMaskIntoConstraints(false)
            line.backgroundColor = borderColor
            addSubview(line)
            
            let views: [NSObject: AnyObject] = ["line": line]
            let metrics: [NSObject: AnyObject] = ["lineWidth": newValue]
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[line]|",
                options: nil, metrics: nil, views: views))
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[line(==lineWidth)]",
                options: nil, metrics: metrics, views: views))
        }
    }
    
    @IBInspectable var rightBorderWidth: CGFloat {
        get {
            return 0.0
        }
        set {
            let line = UIView(frame: CGRect(x: bounds.width, y: 0.0, width: newValue, height: bounds.height))
            line.setTranslatesAutoresizingMaskIntoConstraints(false)
            line.backgroundColor = borderColor
            addSubview(line)
            
            let views: [NSObject: AnyObject] = ["line": line]
            let metrics: [NSObject: AnyObject] = ["lineWidth": newValue]
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("[line(==lineWidth)]|",
                options: nil, metrics: metrics, views: views))
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[line]|",
                options: nil, metrics: nil, views: views))
        }
    }
    @IBInspectable var bottomBorderWidth: CGFloat {
        get {
            return 0.0
        }
        set {
            let line = UIView(frame: CGRect(x: 0.0, y: bounds.height, width: bounds.width, height: newValue))
            line.setTranslatesAutoresizingMaskIntoConstraints(false)
            line.backgroundColor = borderColor
            addSubview(line)
            
            let views: [NSObject: AnyObject] = ["line": line]
            let metrics: [NSObject: AnyObject] = ["lineWidth": newValue]
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[line]|",
                options: nil, metrics: nil, views: views))
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[line(==lineWidth)]|",
                options: nil, metrics: metrics, views: views))
        }
    }

}
