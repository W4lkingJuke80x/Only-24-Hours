//
//  ViewController.swift
//  Only 24 Hours
//
//  Created by Dauren Omarov on 09.12.2021.
//

import UIKit

class DailyViewController: UIViewController {
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var fromDurationLabel: UILabel!
    @IBOutlet weak var toDurationLabel: UILabel!
    
    var rotationAng: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewForGesture = UIView(frame: CGRect(x: 0, y: view.frame.height - view.frame.width, width: view.frame.width, height: view.frame.width))
        view.addSubview(viewForGesture)
        
        let viewForCircle = UIView(frame: CGRect(x: 0, y: 0, width: viewForGesture.frame.width, height: viewForGesture.frame.height))
        viewForGesture.addSubview(viewForCircle)
        
        let circle = Circle()
        circle.drawCircle(on: viewForCircle)
        
        //PAN:
        let panCircle = UIPanGestureRecognizer(target: self, action: #selector(circleRotation(sender:)))
        viewForGesture.addGestureRecognizer(panCircle)
    }
    
    @objc func circleRotation(sender: UIPanGestureRecognizer) {
        if let viewToRotate = sender.view?.subviews[0] {
            
            //PAN:
            let translation = sender.translation(in: sender.view)
            let velocity = sender.velocity(in: sender.view)
            switch sender.state {
            case .began, .changed:
                if velocity.x > 0 {
                    print("clock")
                    rotationAng = CGFloat(Double.pi * 2 * translation.x / viewToRotate.frame.width)
                } else if velocity.x < 0 {
                    print("counter")
                    rotationAng = CGFloat(Double.pi * 2 * translation.x / viewToRotate.frame.width)
                }
                viewToRotate.transform = CGAffineTransform(rotationAngle: rotationAng)
            case .ended:
                break
            default:
                print("something went wrong")
            }
        }
    }

    @IBAction func addTaskPressed(_ sender: UIButton) {
        
    }
    
}

