//
//  ViewController.swift
//  Gestures
//
//  Created by Вороненко Константин Михайлович on 04.05.2026.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var gestureIndicator: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        gestureIndicator.isUserInteractionEnabled = true
        gestureIndicator.textAlignment = .center
        gestureIndicator.numberOfLines = 2
        gestureIndicator.text = "Используйте жесты в этой области"
        gestureIndicator.backgroundColor = .yellow
    }

    @IBAction private func tap(_ sender: UITapGestureRecognizer) {
        gestureIndicator.text = "Жест: касание\nЦвет фона: зеленый"
        gestureIndicator.backgroundColor = .green
    }

    @IBAction private func pinch(_ sender: UIPinchGestureRecognizer) {
        gestureIndicator.text = "Жест: масштабирование\nЦвет фона: красный"
        gestureIndicator.backgroundColor = .red
    }

    @IBAction private func rotation(_ sender: UIRotationGestureRecognizer) {
        gestureIndicator.text = "Жест: вращение\nЦвет фона: синий"
        gestureIndicator.backgroundColor = .blue
    }

    @IBAction private func swipe(_ sender: UISwipeGestureRecognizer) {
        gestureIndicator.text = "Жест: смахивание\nЦвет фона: серый"
        gestureIndicator.backgroundColor = .lightGray
    }

    @IBAction private func longPress(_ sender: UILongPressGestureRecognizer) {
        gestureIndicator.text = "Жест: долгое нажатие\nЦвет фона: оранжевый"
        gestureIndicator.backgroundColor = .orange
    }
}
