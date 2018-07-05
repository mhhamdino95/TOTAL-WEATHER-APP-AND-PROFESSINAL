//
//  File.swift
//  rainyShinnyApply
//
//  Created by A One Way To Allah on 7/3/18.
//  Copyright © 2018 A One Way To Allah. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class gradientView: UIView {
    
    @IBInspectable var firstColour:UIColor=UIColor.clear{
        didSet{uV()}
    }
    @IBInspectable var secendColour:UIColor=UIColor.clear{
        didSet{uV()}
    }
    override class var layerClass:AnyClass{
        get{return CAGradientLayer.self}
        
    }
    
    func uV(){
        let lay=self.layer as! CAGradientLayer
        lay.colors=[firstColour.cgColor,secendColour.cgColor]
        
    }
    
    
}

