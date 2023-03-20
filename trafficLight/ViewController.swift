//
//  ViewController.swift
//  trafficLight
//
//  Created by Келлер Дмитрий on 19.03.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var redView: UIView!
    @IBOutlet private weak var yellowView: UIView!
    @IBOutlet private weak var greenView: UIView!
    
    @IBOutlet private weak var conditionButton: UIButton!
    
    private var colorLight: ColorLight = .red
    private let turnerOn: CGFloat = 1
    private let turnedOff: CGFloat = 0.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conditionButton.layer.cornerRadius = 10
        UIView.animate(withDuration: 2.5) {
            self.redView.center = self.view.center
            self.redView.alpha = 0.2
            self.yellowView.center = self.view.center
            self.yellowView.alpha = 0.2
            self.greenView.center = self.view.center
            self.greenView.alpha = 0.2
        }
 
    }
    
    override func viewWillLayoutSubviews() {
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = redView.frame.width / 2
        greenView.layer.cornerRadius = redView.frame.width / 2
    }
    
    @IBAction private func changeColorLightButton() {
        if conditionButton.currentTitle == "START" {
            conditionButton.setTitle("NEXT", for: .normal)
        }
        
        switch  colorLight {
        case .red:
            redView.alpha = turnerOn
            colorLight = .yellow
            greenView.alpha = turnedOff
        case .yellow:
            redView.alpha = turnedOff
            yellowView.alpha = turnerOn
            colorLight = .green
        case .green:
            yellowView.alpha = turnedOff
            greenView.alpha = turnerOn
            colorLight = .red
        }
    }
}

extension ViewController {
    private enum ColorLight {
        case red
        case yellow
        case green
    }
}



