//
//  ViewController.swift
//  FiguresApp
//
//  Created by Жук Егор Игоревич on 24.05.26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawingView: DrawingView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawingView.figure = Figure(type: .eightLeaf, backgroundColor: .white)
    }
    
    @IBAction func switchFigure(_ sender: UISegmentedControl) {
        print("Segment index: \(sender.selectedSegmentIndex)")
        
        if sender.selectedSegmentIndex == 0 {
            print("Выбран восьмилистник")
            drawingView.figure = Figure(type: .eightLeaf, backgroundColor: .white)
        } else {
            print("Выбран квадрат")
            drawingView.figure = Figure(type: .square, backgroundColor: .white)
        }
    }
}
