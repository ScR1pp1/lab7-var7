//
//  ViewController.swift
//  GesturesFigures
//
//  Created by Жук Егор Игоревич on 24.05.26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawingView: DrawingView!
    @IBOutlet weak var gestureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawingView.figure = Figure(type: .eightLeaf, backgroundColor: .white)
        drawingView.isUserInteractionEnabled = true
        
        gestureLabel.textAlignment = .center
        gestureLabel.numberOfLines = 2
        gestureLabel.text = "Используйте жесты"
        gestureLabel.backgroundColor = .lightGray
    }
    
    // MARK: - Gestures with figure color change
    
    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        gestureLabel.text = "Жест: Касание\nЦвет фона фигуры: зелёный"
        gestureLabel.backgroundColor = .green
        drawingView.figure = Figure(type: drawingView.figure?.type ?? .eightLeaf, backgroundColor: .green)
    }
    
    @IBAction func handleLongPress(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            gestureLabel.text = "Жест: Долгое нажатие\nЦвет фона фигуры: оранжевый"
            gestureLabel.backgroundColor = .orange
            drawingView.figure = Figure(type: drawingView.figure?.type ?? .eightLeaf, backgroundColor: .orange)
        }
    }
    
    @IBAction func handlePinch(_ sender: UIPinchGestureRecognizer) {
        gestureLabel.text = "Жест: Масштабирование\nЦвет фона фигуры: красный"
        gestureLabel.backgroundColor = .red
        drawingView.figure = Figure(type: drawingView.figure?.type ?? .eightLeaf, backgroundColor: .red)
    }
    
    @IBAction func handleRotation(_ sender: UIRotationGestureRecognizer) {
        gestureLabel.text = "Жест: Вращение\nЦвет фона фигуры: синий"
        gestureLabel.backgroundColor = .blue
        drawingView.figure = Figure(type: drawingView.figure?.type ?? .eightLeaf, backgroundColor: .blue)
    }
    
    @IBAction func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        // Свайп меняет саму фигуру (восьмилистник ↔ квадрат)
        let currentType = drawingView.figure?.type ?? .eightLeaf
        let newType: FigureType = currentType == .eightLeaf ? .square : .eightLeaf
        let figureName = newType == .eightLeaf ? "Восьмилистник" : "Квадрат"
        
        gestureLabel.text = "Жест: Смахивание\nФигура: \(figureName)"
        gestureLabel.backgroundColor = .gray
        drawingView.figure = Figure(type: newType, backgroundColor: .white)
    }
}
