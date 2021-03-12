//
//  ProgressView.swift
//  PDFViewer
//
//  Created by Raju on 4/5/20.
//  Copyright © 2020 Raju. All rights reserved.
//

import SwiftUI

public struct ProgressView: View {
    
    var value: Float

    public init(value: Float){
        self.value = value
    }
    
    public var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.primary.opacity(0.001))
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.gray)
                Circle()
                    .trim(from: 0, to: CGFloat(value))
                    .stroke(Color.primary, lineWidth:5)
                    .frame(width:50)
                    .rotationEffect(Angle(degrees:-90))
                Text(getPercentage(value))
            }.frame(width: 200, height: 150)
        }
        .opacity(1)
    }
    
    func getPercentage(_ value:Float) -> String {
        let intValue = Int(ceil(value * 100))
        return "\(intValue) %"
    }
}
