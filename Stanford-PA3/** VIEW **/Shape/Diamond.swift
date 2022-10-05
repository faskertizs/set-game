//
//  Diamond.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 22..
//

import SwiftUI

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        let widthHalf = width / 2
        let heightHalf = height / 2
        
        let upperCorner = CGPoint(x: widthHalf, y: 0)
        let rightCorner = CGPoint(x: width, y: heightHalf)
        let lowerCorner = CGPoint(x: widthHalf, y: height)
        let leftCorner = CGPoint(x: 0, y: heightHalf)
        
        var path  = Path()
        path.move(to: upperCorner)
        path.addLine(to: rightCorner)
        path.addLine(to: lowerCorner)
        path.addLine(to: leftCorner)
        path.addLine(to: upperCorner)

        return path
    }
}
