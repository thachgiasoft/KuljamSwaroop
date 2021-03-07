//
//  PDFViewer.swift
//  PDFViewer
//
//  Created by Raju on 15/4/20.
//  Copyright © 2020 Raju. All rights reserved.
//

import SwiftUI
import PDFKit


public struct PDFViewer: View {

    @State private var showShareSheet = false
    @State var dialogDisplayed = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var rect1: CGRect = .zero
    @State var currentPage = 0
    
    var displayPDF: PDFDisplayable

    public init(displayPDF: PDFDisplayable) {
        self.displayPDF = displayPDF
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                if displayPDF.isRemote {
                    WebView(url: displayPDF.pdfURL)
                } else {
                    PDFReaderView(viewSize: geometry.size, currentPage: $currentPage, displayPDF: displayPDF)
                }
                if dialogDisplayed {
                    CustomAlertWindow(showingCustomWindow: $dialogDisplayed, pdf: displayPDF, page: currentPage)
                }
            }
        }.navigationBarTitle(displayPDF.navigationTitle, displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    Label("", systemImage: "square.and.arrow.up.on.square.fill")
                        .foregroundColor(.black)
                        .onTapGesture {
                            self.showShareSheet = true
                        }
                    Label("", systemImage: "square.and.arrow.down")
                        .foregroundColor(.black)
                        .onTapGesture {
                            dialogDisplayed.toggle()
                        }
                }
            }
        }.sheet(isPresented: $showShareSheet) {
//            self.rect1.uiImage as Any
            ShareSheet(activityItems: ["Shared Via Nijanand App"])
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(presentationMode: presentationMode))
    }
}

