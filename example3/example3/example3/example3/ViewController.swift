//
//  ViewController.swift
//  Animation
//
//  Created by Вороненко Константин Михайлович on 04.05.2026.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var animatedView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation()
    }

    private func startAnimation() {
        UIView.animate(withDuration: 2, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.animatedView.transform = CGAffineTransform(rotationAngle: .pi)
            self.animatedView.center.x += 100
            self.animatedView.alpha = 0.3
        })
    }
}
