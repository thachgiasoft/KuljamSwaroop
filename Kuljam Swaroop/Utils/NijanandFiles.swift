//
//  NijanandFiles.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 12/3/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import Foundation

class NijanandFiles {
    
    public static let shared  = NijanandFiles()
    
    var defaultFileDir: URL?{
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
    }
    
    func fileDirForURL(urlString: String) -> URL? {
        
        guard let defaultFileDir = defaultFileDir, let lastPath = urlString.lastPath else {
            return nil
        }
        
        let localURL = defaultFileDir.appendingPathComponent(lastPath)
        if FileManager.default.fileExists(atPath: localURL.path) {
            return localURL
        }
        
        return nil
        
    }
        
}

extension String {
    var lastPath: String? {
        return URL(string: self)?.lastPathComponent
    }
}
