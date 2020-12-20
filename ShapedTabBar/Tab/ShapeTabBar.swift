//
//  ShapeTabBar.swift
//  ShapedTabBar
//
//  Created by Greener Chen on 2020/12/10.
//  Copyright © 2020 Greener Chen. All rights reserved.
//

import UIKit

class ShapeTabBar: UITabBar {

    var visibleHeight: CGFloat = 56 * 1.5
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
        layer.path = makeCloudPath()
        return layer
    }
    
    private func makeOvalPath() -> CGPath {
        return UIBezierPath(roundedRect: CGRect(x: (UIScreen.main.bounds.size.width - visibleWidth) / 2.0, y: topMargin, width: visibleWidth, height: visibleHeight), cornerRadius: 20.0).cgPath
    }
    
    private func makeCloudPath() -> CGPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: (UIScreen.main.bounds.size.width - visibleWidth) / 2.0, y: topMargin + 28 + 20))
        path.addArc(withCenter: CGPoint(x: (UIScreen.main.bounds.size.width - visibleWidth) / 2.0 + 20, y: topMargin + 28 + 20), radius: 20, startAngle: CGFloat(Double.pi ), endAngle: CGFloat(Double.pi * 1.5), clockwise: true)
        path.addLine(to: CGPoint(x: (UIScreen.main.bounds.size.width - visibleWidth) / 2.0 + itemWidth, y: topMargin + 28))
        path.addArc(withCenter: CGPoint(x: UIScreen.main.bounds.size.width / 2.0, y: topMargin + 28 + 28), radius: 56, startAngle: CGFloat(Double.pi * (2 - 0.837)), endAngle: CGFloat(Double.pi * 1.837), clockwise: true)
        path.addLine(to: CGPoint(x: (UIScreen.main.bounds.size.width - visibleWidth) / 2.0 + visibleWidth - 20, y: topMargin + 28))
        path.addArc(withCenter: CGPoint(x: (UIScreen.main.bounds.size.width - visibleWidth) / 2.0 + visibleWidth - 20, y: topMargin + 28 + 20), radius: 20, startAngle: CGFloat(Double.pi * 1.5), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        path.addLine(to: CGPoint(x: (UIScreen.main.bounds.size.width - visibleWidth) / 2.0 + visibleWidth, y: topMargin + visibleHeight - 20 - 20))
        path.addArc(withCenter: CGPoint(x: (UIScreen.main.bounds.size.width - visibleWidth) / 2.0 + visibleWidth - 20, y: topMargin + visibleHeight - 20), radius: 20, startAngle: 0, endAngle: CGFloat(Double.pi * 0.5), clockwise: true)
        path.addLine(to: CGPoint(x: (UIScreen.main.bounds.size.width - visibleWidth) / 2.0 + 20, y: topMargin + visibleHeight))
        path.addArc(withCenter: CGPoint(x: (UIScreen.main.bounds.size.width - visibleWidth) / 2.0 + 20, y: topMargin + visibleHeight - 20), radius: 20, startAngle: CGFloat(Double.pi * 0.5), endAngle: CGFloat(Double.pi), clockwise: true)
        path.close()
        return path.cgPath
    }
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        guard let window = UIApplication.shared.keyWindow else {
            return size
        }
        size.height = window.safeAreaInsets.bottom + topMargin + bottomMargin + visibleHeight
        return size
    }
}
