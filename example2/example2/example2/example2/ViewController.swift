//
//  ViewController.swift
//  SimpleGraphics
//
//  Created by Вороненко Константин Михайлович on 04.05.2026.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let shapeView = ShapeView(frame: view.bounds)
        shapeView.backgroundColor = .clear
        view.addSubview(shapeView)
    }
}

