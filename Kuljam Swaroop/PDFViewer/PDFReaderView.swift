//
//  PDFReaderView.swift
//  PDFViewer
//
//  Created by Raju on 4/5/20.
//  Copyright © 2020 Raju. All rights reserved.
//

import SwiftUI
import PDFKit

struct PDFReaderView : UIViewRepresentable {

    var viewSize: CGSize = CGSize(width: 0.0, height: 0.0)
    let pdfThumbnailSize = CGSize(width: 40, height: 54)
    var pdfView = PDFView()
    var pageNumberLabel = UILabel()
    let activityView = UIActivityIndicatorView(style: .large)
    
    @Binding var currentPage: Int
    
    var displayPDF: PDFDisplayable

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public class Coordinator: NSObject {
        var parent: PDFReaderView
        
        init(_ parent: PDFReaderView) {
            self.parent = parent
        }
        
        @objc func handlePageChange(notification: Notification) {
            parent.currentPage = parent.pdfView.currentPage?.pageRef?.pageNumber ?? 0
            parent.setPageNumberLabel()
        }
        
        @objc func handleAnnotationHit(notification: Notification) {
            if let annotation = notification.userInfo?["PDFAnnotationHit"] as? PDFAnnotation {
                parent.pdfAnnotationTapped(annotation: annotation)
            }
        }
    }
    
    public func makeUIView(context: Context) -> UIView {
        return preparePDFView(context: context)
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {
        if let targetPage = pdfView.document?.page(at: currentPage) {
            pdfView.go(to: targetPage)
        }
    }
    
    private func preparePDFView(context: Context) -> PDFView {
        pdfView.displayDirection = .horizontal
        pdfView.usePageViewController(true)
        pdfView.pageBreakMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        pdfView.autoScales = true
        
        pdfView.document = PDFDocument(url: displayPDF.pdfURL)
   
        thumbnailView(pdfView: pdfView, viewSize: viewSize)
        pageLabel(viewSize: viewSize)
        
        NotificationCenter.default.addObserver(context.coordinator, selector: #selector(context.coordinator.handlePageChange(notification:)), name: Notification.Name.PDFViewPageChanged, object: nil)
        NotificationCenter.default.addObserver(context.coordinator, selector: #selector(context.coordinator.handleAnnotationHit(notification:)), name: Notification.Name.PDFViewAnnotationHit, object: nil)

        return pdfView
    }
    
    private func thumbnailView(pdfView: PDFView, viewSize: CGSize) {
        let thumbnailView = PDFThumbnailView(frame: CGRect(x: 0, y: viewSize.height - pdfThumbnailSize.height - 8, width: viewSize.width, height: pdfThumbnailSize.height))
        thumbnailView.backgroundColor = UIColor.clear
        thumbnailView.thumbnailSize = pdfThumbnailSize
        thumbnailView.layoutMode = .horizontal
        thumbnailView.pdfView = pdfView
        pdfView.addSubview(thumbnailView)
    }
    
    func setPageNumberLabel() {
        pageNumberLabel.text = String(format: "%@ of %d", pdfView.currentPage?.label ?? "0", pdfView.document?.pageCount ?? 0)
    }
    
    private func pageLabel(viewSize: CGSize) {
        pageNumberLabel.frame = CGRect(x: viewSize.width - 88, y: 20, width: 80, height: 20)
        pageNumberLabel.font = UIFont.systemFont(ofSize: 14.0)
        pageNumberLabel.textAlignment = .right
        setPageNumberLabel()
        pdfView.addSubview(pageNumberLabel)
    }
    
    private func pdfAnnotationTapped(annotation: PDFAnnotation) {
        let pdfUrl = annotation.url
        print(pdfUrl ?? "")
    }
}
