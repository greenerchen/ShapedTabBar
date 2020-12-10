//
//  ShapeTabBar.swift
//  ShapedTabBar
//
//  Created by Greener Chen on 2020/12/10.
//  Copyright © 2020 Greener Chen. All rights reserved.
//

import UIKit

class ShapeTabBar: UITabBar {

    var visibleHeight: CGFloat = 56
    var visibleWidth: CGFloat {
        if let items = items {
            return itemWidth * CGFloat(items.count)
        } else {
            return 0
        }
    }
    var topMargin: CGFloat = 10
    var bottomMargin: CGFloat = 10
    
    override func awakeFromNib() {
        setupItemPositions()
        clipsToBounds = true
    }
    
    private func setupItemPositions() {
        itemPositioning = .centered
        itemWidth = 75
        itemSpacing = 0.01
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.mask = makeShapeLayer()
    }
    
    private func makeShapeLayer() -> CALayer {
        let layer = CAShapeLayer()
        layer.path = makeOvalPath()
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        return layer
    }
    
    private func makeOvalPath() -> CGPath {
        return UIBezierPath(roundedRect: CGRect(x: (UIScreen.main.bounds.size.width - visibleWidth) / 2.0, y: topMargin, width: visibleWidth, height: visibleHeight), cornerRadius: 20.0).cgPath
    }
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height += topMargin + bottomMargin
        return size
    }
}
