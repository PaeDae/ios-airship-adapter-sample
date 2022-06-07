//
//  UIExtensions.swift
//  airship-adapter-sample
//
//  Created by Andrew Tran on 5/18/22.
//

import Foundation
import UIKit

extension UIView {
    struct AnchoredConstraints {
        var top,
            leading,
            bottom,
            trailing,
            width,
            height,
            centerX,
            centerY: NSLayoutConstraint?
    }
    
    @discardableResult
    func anchor(
        top: NSLayoutYAxisAnchor?,
        leading: NSLayoutXAxisAnchor?,
        bottom: NSLayoutYAxisAnchor?,
        trailing: NSLayoutXAxisAnchor?,
        padding: UIEdgeInsets = .zero,
        size: CGSize = .zero,
        centerX: NSLayoutXAxisAnchor?,
        centerY: NSLayoutYAxisAnchor?,
        centerXOffset: CGFloat = 0,
        centerYOffset: CGFloat = 0
    ) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(
                equalTo: top,
                constant: padding.top
            )
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(
                equalTo: leading,
                constant: padding.left
            )
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(
                equalTo: bottom,
                constant: -padding.bottom
            )
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(
                equalTo: trailing,
                constant: -padding.right
            )
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(
                equalToConstant: size.width
            )
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(
                equalToConstant: size.height
            )
        }
        
        if let centerX = centerX {
            anchoredConstraints.centerX = centerXAnchor.constraint(
                equalTo: centerX,
                constant: centerXOffset
            )
        }
        
        if let centerY = centerY {
            anchoredConstraints.centerY = centerYAnchor.constraint(
                equalTo: centerY,
                constant: centerYOffset
            )
        }
        
        [
            anchoredConstraints.top,
            anchoredConstraints.leading,
            anchoredConstraints.bottom,
            anchoredConstraints.trailing,
            anchoredConstraints.width,
            anchoredConstraints.height,
            anchoredConstraints.centerX,
            anchoredConstraints.centerY
        ].forEach {
            $0?.isActive = true
        }
      
        return anchoredConstraints
    }
}
