//
//  PDFViewController.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 5/3/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0

    var body: some View {
        VStack {
//            PageViewController(pages: pages, currentPage: $currentPage)
            Text("Current Page: \(currentPage)")
        }
    }
}

