//
//  FailedView.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 12/3/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import SwiftUI

public struct FailedView: View {
    
//    @State var retryDownload: Bool = false
    var retryDownload : () -> ()
    
    public var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.primary.opacity(0.001))
            ZStack {
                VStack {
                    Text("Oops!!! Failed to load").foregroundColor(.black)
                    Button("Retry") {
                        retryDownload()
                    }.foregroundColor(.black)
                }.padding()
            }.padding()
        }
        .opacity(1)
    }
    
}
