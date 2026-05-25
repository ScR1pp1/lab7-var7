//
//  DrawingView.swift
//  FiguresApp
//
//  Created by Жук Егор Игоревич on 24.05.26.
//

import UIKit

class DrawingView: UIView {
    
    var figure: Figure? {
        didSet { setNeedsDisplay() }
    }
    
    override func draw(_ rect: CGRect) {
        guard let figure = figure else { return }
        
        figure.backgroundColor.setFill()
        UIBezierPath(rect: rect).fill()
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 5
        
        let path = figure.draw(in: rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.saveGState()
        context.addPath(path.cgPath)
        context.clip()
        
        let gradient = CGGradient(
            colorsSpace: CGColorSpaceCreateDeviceRGB(),
            colors: [UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor] as CFArray,
            locations: [0, 1]
        )
        context.drawLinearGradient(
            gradient!,
            start: CGPoint(x: rect.midX, y: rect.minY),
            end: CGPoint(x: rect.midX, y: rect.maxY),
            options: []
        )
        context.restoreGState()
        
        path.lineWidth = 3
        UIColor.white.setStroke()
        path.stroke()
    }
}
