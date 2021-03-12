//
//  PDFViewer.swift
//  PDFViewer
//
//  Created by Raju on 15/4/20.
//  Copyright © 2020 Raju. All rights reserved.
//

import SwiftUI
import PDFKit


public struct TestPDFViewer: View {

    @State private var showShareSheet = false
    @State private var showSaveSheet = false

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext

    @ObservedObject var pdfViewModel: PDFViewModel

    @State private var rect1: CGRect = .zero
    @State var currentPage = 0

    var displayPDF: PDFDisplayable

    public init(displayPDF: PDFDisplayable) {
        self.displayPDF = displayPDF
        self.pdfViewModel = PDFViewModel(pdfURL: displayPDF.pdfRemoteURL.absoluteString)

    }

    public var body: some View {

        GeometryReader { geometry in
            ZStack {
                switch self.pdfViewModel.pdfState {
                    case .loading(let progress):
                        ProgressView(value: progress)
                    case .failed:
                        FailedView(retryDownload: pdfViewModel.retryDownload)
                    case .downloaded(let url):
                        PDFReaderView(viewSize: geometry.size, currentPage: $currentPage, url: url)
                    }
            }
        }.navigationBarTitle(displayPDF.displayTitle, displayMode: .inline)
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
                            self.showSaveSheet = true
                        }
                }
            }
        }.sheet(isPresented: $showShareSheet) {
//            self.rect1.uiImage as Any
            ShareSheet(activityItems: ["Shared Via Nijanand App"])
        }.sheet(isPresented: $showSaveSheet) {
            AddChaupaiSheet(pdf: self.displayPDF, pageNumber: Int16(currentPage))
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(presentationMode: presentationMode))
    }
}

