//
//  PDFDisplayable.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 6/3/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import Foundation

public protocol PDFDisplayable {
    var displayTitle: String { get }
    var pdfRemoteURL: URL { get }
}
