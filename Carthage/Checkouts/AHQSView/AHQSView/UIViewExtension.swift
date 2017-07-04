//
//  UIViewExtension.swift
//  AHQSLibrary
//
//  Created by André Henrique da Silva on 28/10/2016.
//  Copyright © 2016 André Henrique da Silva. All rights reserved.
//

import UIKit

public extension UIView {
    
    @discardableResult
    public func setupConstraints(
        topAnchor: NSLayoutYAxisAnchor?, topConstant: CGFloat,
        leftAnchor: NSLayoutXAxisAnchor?, leftConstant: CGFloat,
        bottomAnchor: NSLayoutYAxisAnchor?, bottomConstant: CGFloat,
        rightAnchor: NSLayoutXAxisAnchor?, rightConstant: CGFloat,
        width: CGFloat = 0.0, height: CGFloat = 0.0
        
        ) -> [String: NSLayoutConstraint?] {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [String: NSLayoutConstraint?]()
        
        if let top = topAnchor {
            
            let topConstraint = self.topAnchor.constraint(equalTo: top, constant: topConstant)
            
            topConstraint.isActive = true
            
            constraints.updateValue(topConstraint, forKey: "top")
        } else {
            constraints.updateValue(nil, forKey: "top")
        }
        
        if let left = leftAnchor {
            
            let leftConstraint = self.leadingAnchor.constraint(equalTo: left, constant: leftConstant)
            
            leftConstraint.isActive = true
            
            constraints.updateValue(leftConstraint, forKey: "left")
        } else {
            constraints.updateValue(nil, forKey: "left")
        }
        
        if let bottom = bottomAnchor {
            
            let bottomConstraint = self.bottomAnchor.constraint(equalTo: bottom, constant: bottomConstant)
            
            bottomConstraint.isActive = true
            
            constraints.updateValue(bottomConstraint, forKey: "bottom")
        } else {
            constraints.updateValue(nil, forKey: "bottom")
        }
        
        if let right = rightAnchor {
            
            let rightConstraint = self.trailingAnchor.constraint(equalTo: right, constant: rightConstant)
            
            rightConstraint.isActive = true
            
            constraints.updateValue(rightConstraint, forKey: "right")
        } else {
            constraints.updateValue(nil, forKey: "right")
        }
        
        if width > 0.0 {
            let widthConstraint = self.widthAnchor.constraint(equalToConstant: width)
            widthConstraint.isActive = true
            
            constraints.updateValue(widthConstraint, forKey: "width")
        } else {
            constraints.updateValue(nil, forKey: "width")
        }
        
        if height > 0.0 {
            let heightConstraint = self.heightAnchor.constraint(equalToConstant: height)
            heightConstraint.isActive = true
            
            constraints.updateValue(heightConstraint, forKey: "height")
        } else {
            constraints.updateValue(nil, forKey: "height")
        }
        
        return constraints
    }
    
    @discardableResult
    public func setHeightRelativeTo(_ view: UIView, multiplier: CGFloat) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier)
        heightConstraint.isActive = true
        
        return heightConstraint
    }
    
    @discardableResult
    public func setWidthRelativeTo(_ view: UIView, multiplier: CGFloat) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier)
        widthConstraint.isActive = true
        
        return widthConstraint
    }
}
