//
//  ShapeView.swift
//  SimpleGraphics
//
//  Created by Вороненко Константин Михайлович on 04.05.2026.
//

import UIKit

final class ShapeView: UIView {

    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }

        // Прямоугольник
        ctx.setFillColor(UIColor.red.cgColor)
        ctx.fill(CGRect(x: 30, y: 100, width: 120, height: 80))

        // Круг
        ctx.setFillColor(UIColor.blue.cgColor)
        ctx.fillEllipse(in: CGRect(x: 200, y: 100, width: 100, height: 100))

        // Треугольник
        ctx.setFillColor(UIColor.green.cgColor)
        ctx.beginPath()
        ctx.move(to: CGPoint(x: 50, y: 300))
        ctx.addLine(to: CGPoint(x: 150, y: 400))
        ctx.addLine(to: CGPoint(x: 30, y: 400))
        ctx.closePath()
        ctx.fillPath()

        // Линия
        ctx.setStrokeColor(UIColor.orange.cgColor)
        ctx.setLineWidth(4)
        ctx.beginPath()
        ctx.move(to: CGPoint(x: 200, y: 300))
        ctx.addLine(to: CGPoint(x: 300, y: 400))
        ctx.strokePath()
    }
}
