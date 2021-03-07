//
//  GridView.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 6/3/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import SwiftUI

struct GridView<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
           self.rows = rows
           self.columns = columns
           self.content = content
       }
}
