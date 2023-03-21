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
    private let turnedOff: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conditionButton.layer.cornerRadius = 10
        animateRed()
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
            greenView.alpha = turnedOff
            colorLight = .yellow
        case .yellow:
            redView.alpha = turnedOff
            yellowView.alpha = turnerOn
            colorLight = .green
            animateYellow()
            //increaseYellow()
        case .green:
            yellowView.alpha = turnedOff
            greenView.alpha = turnerOn
            colorLight = .red
            animateGreen()
            //increaseGreen()
        }
    }
    
    // MARK AnimateFunc
    // кнопка улетает вправо
    func increaseRed() {
        UIView.animate(withDuration: 0.5, delay: 0.4,
                       options: .repeat, animations: {
            self.redView.center.x += self.view.bounds.width
        }, completion: nil)
    }
    func increaseYellow() {
        UIView.animate(withDuration: 0.8, delay: 0.4,
                       options: .transitionCurlUp, animations: {
            self.yellowView.center.x += self.view.bounds.maxX
        }, completion: nil)
    }
    func increaseGreen() {
        UIView.animate(withDuration: 0.8, delay: 0.4,
                       options: .curveEaseInOut, animations: {
            self.greenView.center.x += self.view.center.y
        }, completion: nil)
    }
    
    // мигание
    func animateRed() {
        UIView.animate(withDuration: 4, delay: 0.4, options: .repeat) {
            self.redView.contentScaleFactor += 1
            self.redView.alpha += 0.2
            
        }
    }
    func animateYellow() {
        UIView.animate(withDuration: 2, delay: 0.4, options: .repeat){
            self.redView.contentScaleFactor += 1
            self.yellowView.alpha = +0.2
        }
        
    }
    func animateGreen() {
        UIView.animate(withDuration: 4, delay: 0.4, options: .repeat) {
            self.redView.contentScaleFactor += 1
            self.greenView.alpha = +0.2
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



