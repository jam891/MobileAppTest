//
//  IndicatorItem.swift
//  MobileAppTest
//
//  Created by Vitaliy Delidov on 7/21/15.
//  Copyright (c) 2015 Vitaliy Delidov. All rights reserved.
//

import UIKit

enum State {
    case Hidden
    case Show
    case Checked
}

@IBDesignable
class IndicatorItem: UIView {

    @IBInspectable var number: String = String()
    @IBInspectable var textSize: CGFloat = 18
    @IBInspectable var checkmarkSize: CGFloat = 4.0
    @IBInspectable var lineWidth: CGFloat = 1.0
    
    let color = UIColor(red: 0.1, green: 0.67, blue: 0.62, alpha: 1)
    var state = State.Hidden {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Set up Ellipse path
    
    func setUpEllipsePath() {
        let ellipsePath = UIBezierPath(
            ovalInRect: CGRectInset(bounds, lineWidth / 2, lineWidth / 2))
        
        switch state {
        case .Hidden:
            ellipsePath.lineWidth = lineWidth
            color.setStroke()
            ellipsePath.stroke()
        case .Show:
            color.setFill()
            ellipsePath.fill()
        case .Checked:
            color.setFill()
            ellipsePath.fill()
        }
    }
    
    // MARK: - Set up text
    
    func setUpText() {
        var textColor: UIColor  {
            return state == .Hidden ? color : UIColor.whiteColor()
        }
        
        let attributes = [
            NSFontAttributeName: UIFont(name: "Avenir-Black", size: textSize)!,
            NSForegroundColorAttributeName: textColor,
        ]
        
        let size = number.sizeWithAttributes(attributes)
        let x = CGRectGetMidX(bounds) - size.width / 2
        let y = CGRectGetMidY(bounds) - size.height / 2
    
        number.drawAtPoint(CGPoint(x: x, y: y), withAttributes: attributes)
    }
    
    // MARK: - Set up checkmark
    
    func setUpCheckmark() {
        let frame = CGRectInset(bounds, lineWidth / 2, lineWidth / 2)
        
        let startX = CGRectGetMinX(frame) + 0.27083 * CGRectGetWidth(frame)
        let startY = CGRectGetMinY(frame) + 0.54167 * CGRectGetHeight(frame)
        let startPoint = CGPointMake(startX, startY)
        
        let midX = CGRectGetMinX(frame) + 0.41667 * CGRectGetWidth(frame)
        let midY = CGRectGetMinY(frame) + 0.68750 * CGRectGetHeight(frame)
        let midPoint = CGPointMake(midX, midY)
        
        let endX = CGRectGetMinX(frame) + 0.75000 * CGRectGetWidth(frame)
        let endY = CGRectGetMinY(frame) + 0.35417 * CGRectGetHeight(frame)
        let endPoint = CGPointMake(endX, endY)
        
        let checkmarkPath = UIBezierPath()
        checkmarkPath.moveToPoint(startPoint)
        checkmarkPath.addLineToPoint(midPoint)
        checkmarkPath.addLineToPoint(endPoint)
        
        let checkmarkLayer = CAShapeLayer()
        checkmarkLayer.path = checkmarkPath.CGPath
        checkmarkLayer.lineWidth = checkmarkSize
        checkmarkLayer.strokeColor = UIColor.whiteColor().CGColor
        checkmarkLayer.fillColor = UIColor.clearColor().CGColor
        
        layer.addSublayer(checkmarkLayer)
    }
    
    
    // MARK: - Drawing
    
    override func drawRect(rect: CGRect) {
        setUpEllipsePath()
        
        state == .Checked ? setUpCheckmark() : setUpText()
    }

}
