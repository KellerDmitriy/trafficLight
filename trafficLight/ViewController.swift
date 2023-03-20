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
    
    enum ColorLight {
        case redLight
        case yellowLight
        case greenLight
    }
    
    var colorLight: ColorLight = .redLight
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = redView.frame.width / 2
        greenView.layer.cornerRadius = redView.frame.width / 2
        conditionButton.layer.cornerRadius = 10
    }

    @IBAction private func changeColorLightButton() {
        conditionButton.setTitle("NEXT", for: .normal)
        
        func change(colorLight: ColorLight) {
            switch  colorLight {
            case .redLight:
                redView.alpha = 1
                yellowView.alpha = 0.3
                greenView.alpha = 0.3
            case .yellowLight:
                redView.alpha = 0.3
                yellowView.alpha = 1
                greenView.alpha = 0.3
            case .greenLight:
                redView.alpha = 0.3
                yellowView.alpha = 0.3
                greenView.alpha = 1
            }
        }
        
        change(colorLight: colorLight)
        colorLight = .yellowLight
        
        
    }
}


