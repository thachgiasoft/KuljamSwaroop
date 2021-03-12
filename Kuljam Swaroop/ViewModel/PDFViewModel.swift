//
//  PDFViewModel.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 12/3/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import Foundation
import SwiftUI

enum PDFState {
    case loading(progress: Float)
    case failed
    case downloaded(localURL: URL)
}

class PDFViewModel: ObservableObject, DownloadManagerDelegate {
    
    @ObservedObject var downloadManager = DownloadManager.shared()
    @Published var pdfState: PDFState = .loading(progress: 0.0)
    
    var pdfURL: String
    
    init(pdfURL: String) {
        self.pdfURL = pdfURL
        if let localURL =  NijanandFiles.shared.fileDirForURL(urlString: pdfURL) {
            pdfState = .downloaded(localURL: localURL)
        } else {
            downloadPDF(pdfUrlString: pdfURL)
        }
        
    }
    
    func retryDownload() {
        pdfState = .loading(progress: 0.0)
        downloadPDF(pdfUrlString: pdfURL)
    }
    
    private func downloadPDF(pdfUrlString: String) {
        guard let url = URL(string: pdfUrlString) else { return }
        downloadManager.delegate = self
        downloadManager.downloadFile(url: url)
    }
    
    func downloadDidFinished(success: Bool) {
        DispatchQueue.main.async { [weak self] in
            
            guard let self = self else {
                return
            }
            
            if let localURL =  NijanandFiles.shared.fileDirForURL(urlString: self.pdfURL) {
                self.pdfState = .downloaded(localURL: localURL)
            } else {
                self.pdfState = .failed
            }
        }
    }
    
    func downloadDidFailed(failure: Bool) {
        pdfState = .failed
    }
    
    func downloadInProgress(progress: Float, totalBytesWritten: Float, totalBytesExpectedToWrite: Float) {
        pdfState = .loading(progress: progress)
    }
    
    
}
