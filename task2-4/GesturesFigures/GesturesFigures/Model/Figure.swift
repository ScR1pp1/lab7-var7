//
//  Figure.swift
//  FiguresApp
//
//  Created by Жук Егор Игоревич on 24.05.26.
//

import UIKit

enum FigureType {
    case eightLeaf
    case square
    
    func path(in rect: CGRect) -> UIBezierPath {
        switch self {
        case .eightLeaf:
            return drawEightLeaf(in: rect)
        case .square:
            return drawSquare(in: rect)
        }
    }
    
    private func drawEightLeaf(in rect: CGRect) -> UIBezierPath {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) * 0.35
        let path = UIBezierPath()
        
        for i in 0..<8 {
            let startAngle = CGFloat(i) * .pi * 2 / 8
            let endAngle = startAngle + .pi * 2 / 8
            let cp1 = CGPoint(
                x: center.x + radius * 1.5 * cos(startAngle + .pi/16),
                y: center.y + radius * 1.5 * sin(startAngle + .pi/16)
            )
            let cp2 = CGPoint(
                x: center.x + radius * 1.5 * cos(endAngle - .pi/16),
                y: center.y + radius * 1.5 * sin(endAngle - .pi/16)
            )
            let p1 = CGPoint(
                x: center.x + radius * cos(startAngle),
                y: center.y + radius * sin(startAngle)
            )
            let p2 = CGPoint(
                x: center.x + radius * cos(endAngle),
                y: center.y + radius * sin(endAngle)
            )
            path.move(to: p1)
            path.addCurve(to: p2, controlPoint1: cp1, controlPoint2: cp2)
        }
        path.close()
        return path
    }
    
    private func drawSquare(in rect: CGRect) -> UIBezierPath {
        let size = min(rect.width, rect.height) * 0.5
        let squareRect = CGRect(
            x: rect.midX - size/2,
            y: rect.midY - size/2,
            width: size,
            height: size
        )
        return UIBezierPath(rect: squareRect)
    }
}

struct Figure {
    let type: FigureType
    let backgroundColor: UIColor
    
    func draw(in rect: CGRect) -> UIBezierPath {
        return type.path(in: rect)
    }
}
