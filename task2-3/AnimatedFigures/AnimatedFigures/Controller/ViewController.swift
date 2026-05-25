//
//  ViewController.swift
//  AnimatedFigures
//
//  Created by Жук Егор Игоревич on 24.05.26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawingView: DrawingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawingView.figure = Figure(type: .eightLeaf, backgroundColor: .white)
    }
    
    @IBAction func moveAnimation(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0) {
            self.drawingView.transform = CGAffineTransform(translationX: 50, y: 50)
        } completion: { _ in
            UIView.animate(withDuration: 1.0) {
                self.drawingView.transform = .identity
            }
        }
    }
    
    @IBAction func rotateAnimation(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0) {
            self.drawingView.transform = CGAffineTransform(rotationAngle: .pi)
        } completion: { _ in
            UIView.animate(withDuration: 1.0) {
                self.drawingView.transform = .identity
            }
        }
    }
    
    @IBAction func scaleAnimation(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0) {
            self.drawingView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        } completion: { _ in
            UIView.animate(withDuration: 1.0) {
                self.drawingView.transform = .identity
            }
        }
    }
    
    @IBAction func alphaAnimation(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0) {
            self.drawingView.alpha = 0.3
        } completion: { _ in
            UIView.animate(withDuration: 1.0) {
                self.drawingView.alpha = 1.0
            }
        }
    }
}
