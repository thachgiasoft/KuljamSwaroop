//
//  PDFContentView.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 2/3/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import PDFKit
import SwiftUI

struct PDFKitView: View {
    
    @State var isNavigationBarHidden: Bool = true
    
    var displayPDF: PDFDisplayable
    
    var body: some View {
        
        VStack {
            if displayPDF.isRemote {
                WebView(request: URLRequest(url: displayPDF.pdfURL))
            } else {
                PDFKitRepresentedView(displayPDF.pdfURL)
            }
        }.navigationBarTitle(Text(displayPDF.navigationTitle), displayMode: .inline)
        
    }
}

struct PDFKitRepresentedView: UIViewRepresentable {
    
    let url: URL
    
    init(_ url: URL) {
        self.url = url
    }

    func makeUIView(context: UIViewRepresentableContext<PDFKitRepresentedView>) -> PDFKitRepresentedView.UIViewType {

        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: self.url)
        pdfView.autoScales = true
//        pdfView.displayMode = .singlePage
        pdfView.displayDirection = .vertical
//        pdfView.usePageViewController(true, withViewOptions: [UIPageViewController.OptionsKey.interPageSpacing: 10])
        
        return pdfView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PDFKitRepresentedView>) {
        // Update the view.
    }
}
