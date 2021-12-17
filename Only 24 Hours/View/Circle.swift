//
//  CircleView.swift
//  Only 24 Hours
//
//  Created by Dauren Omarov on 09.12.2021.
//

import UIKit

struct Circle {
    func drawCircle(on view: UIView) {
        
        let newCircle = CAShapeLayer()
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: view.frame.width/2, y: view.frame.height/2), radius: view.frame.width*0.4, startAngle: -.pi/2, endAngle: .pi*3/2, clockwise: true)
        
        newCircle.path = circlePath.cgPath
        newCircle.lineWidth = 15
        newCircle.strokeColor = UIColor.blue.cgColor
        newCircle.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(newCircle)
        
        //initial Arc
        let startArc = CAShapeLayer()
        let startArcPath = UIBezierPath(arcCenter: CGPoint(x: view.frame.width/2, y: view.frame.height/2), radius: view.frame.width*0.4, startAngle: -.pi*2/3, endAngle: -.pi*1/3, clockwise: true)
        
        startArc.path = startArcPath.cgPath
        startArc.lineWidth = 15
        startArc.strokeColor = UIColor.red.cgColor
        startArc.fillColor = UIColor.clear.cgColor
        newCircle.addSublayer(startArc)
    }
}
