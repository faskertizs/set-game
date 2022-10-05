//
//  Oval.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 22..
//

import SwiftUI

struct Oval: Shape {
    
    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        
        let isHorizontal = (width > height)
        let radius = min(width, height) / 2
        
        var path  = Path()
        if isHorizontal {
            path.move(to: CGPoint(x: radius, y: 0))
            path.addArc(
                center: CGPoint(x: radius, y: radius),
                radius: radius,
                startAngle: Angle(degrees: -90),
                endAngle: Angle(degrees: 90),
                clockwise: true
            )
            path.addLine(to: CGPoint(x: width - radius, y: height))
            path.addArc(
                center: CGPoint(x: width - radius, y: radius),
                radius: radius,
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: -90),
                clockwise: true
            )
            path.addLine(to: CGPoint(x: radius, y: 0))
        } else {
            path.move(to: CGPoint(x: 0, y: radius))
            path.addArc(
                center: CGPoint(x: radius, y: radius),
                radius: radius,
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 0),
                clockwise: false
            )
            path.addLine(to: CGPoint(x: width, y: height - radius))
            path.addArc(
                center: CGPoint(x: radius, y: height - radius),
                radius: radius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
            path.addLine(to: CGPoint(x: 0, y: radius))
        }

        return path
    }
}
