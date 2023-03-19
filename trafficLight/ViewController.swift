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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCornerRadius(for: [redView, yellowView, greenView])
        conditionButton.layer.cornerRadius = 10
    }
    
    private func getCornerRadius(
        for colorsView: [UIView]) {
            if redView.frame.width == yellowView.frame.width &&
                yellowView.frame.width == greenView.frame.width  {
                let radius: CGFloat = redView.frame.width / 2
                for colorView in colorsView {
                    colorView.layer.cornerRadius = radius
                }
            }
        }
    
    func switchLight(for color: UIView) {
        color.alpha = 1
        if color.alpha == 1 {
            color.alpha = 0.3
        }
    }
    
    @IBAction private func changeColorLightButton() {
        
        
        
        //        if color.alpha < 1 {
        //            redView.alpha = 1
        //        }
        //        if redView.alpha == 1 {
        //            redView.alpha = 0.3
        //            yellowView.alpha = 1
        //        }
        //        if yellowView.alpha == 1 {
        //            yellowView.alpha = 0.3
        //            greenView.alpha = 1
        //        }
        //        if greenView.alpha == 1 {
        //            greenView.alpha = 0.3
        //            redView.alpha = 1
        //        }
        
        switchLight(for: redView)
        switchLight(for: yellowView)
        switchLight(for: greenView)
        conditionButton.setTitle("NEXT", for: .normal)
        
    }
}



