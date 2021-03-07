//
//  Theme.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 6/3/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

class Theme {
    
    static let shared = Theme()
    
    func setUpTheme() {
        UITabBar.appearance().backgroundColor = UIColor(named: "BrandColor")
        UITabBar.appearance().barTintColor = UIColor(named: "BrandColor")
        UITableView.appearance().separatorStyle = .none
    }
    
    var buttonFont: Font {
        return Font.system(size: 22, weight: .bold, design: .default)
    }
    
    var titleFont: Font {
        return Font.system(size: 20, weight: .bold, design: .default)
    }
    
    var subTitleFont: Font {
        return Font.system(size: 18, weight: .semibold, design: .default)
    }
}


struct BackButton: View {
    
    var presentationMode : Binding<PresentationMode>

    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                Spacer()
            }
        }.frame(width: 44, height: 44)
    }
}

