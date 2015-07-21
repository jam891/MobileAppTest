//
//  IndicatorView.swift
//  MobileAppTest
//
//  Created by Vitaliy Delidov on 7/21/15.
//  Copyright (c) 2015 Vitaliy Delidov. All rights reserved.
//

import UIKit

class IndicatorView: UIView {
    
    var view: UIView!
    
    @IBOutlet weak var step1: IndicatorItem!
    @IBOutlet weak var step2: IndicatorItem!
    @IBOutlet weak var step3: IndicatorItem!
    @IBOutlet weak var step4: IndicatorItem!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var personalLabel: UILabel!
    @IBOutlet weak var vinLabel: UILabel!
    @IBOutlet weak var carLabel: UILabel!
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "IndicatorView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }


}
