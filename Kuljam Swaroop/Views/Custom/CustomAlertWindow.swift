//
//  Dialog.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 7/3/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import SwiftUI

struct CustomAlertWindow: View {
    
    @Binding var showingCustomWindow: Bool
    @State var nameValue: String
    @State var chaupaiNumberValue: String
    var pdf: PDFDisplayable
    var page: Int
    
    init(showingCustomWindow: Binding<Bool>, pdf: PDFDisplayable, page: Int) {
        _showingCustomWindow = showingCustomWindow
        _nameValue = State<String>(initialValue: "")
        _chaupaiNumberValue = State<String>(initialValue: "")
        self.pdf = pdf
        self.page = page
    }
    
      var body: some View {
        ZStack {
          Rectangle()
            .fill(Color.gray)
            .opacity(0.5)
          ZStack {
            Rectangle()
              .fill(Color.white)
              .frame(width: 320, height: 350)
              .cornerRadius(25)
            ZStack {
                VStack(spacing: 10) {
                Text(Strings.shared.saveAlertTitle).multilineTextAlignment(.center).font(Theme.shared.subTitleFont)
                    .padding(10)
                    Text("Book: \(pdf.navigationTitle)").font(Theme.shared.titleFont).padding(.bottom, 10)
                TextField(Strings.shared.saveAlertTitlePlaceholder, text: $nameValue).textFieldStyle(RoundedBorderTextFieldStyle()).lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                TextField(Strings.shared.saveAlertNumberPlaceHolder, text: $chaupaiNumberValue).textFieldStyle(RoundedBorderTextFieldStyle()).lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/).keyboardType(.numberPad).padding(.bottom, 10)
                Button(Strings.shared.saveAlertSaveButton) {
                    saveChaupai()
                    showingCustomWindow.toggle()
                }.foregroundColor(Color("BrandColor"))
                .font(Theme.shared.buttonFont)
                Button(Strings.shared.saveAlertCancelButton) {
                    showingCustomWindow.toggle()
                }.foregroundColor(Color("BrandColor"))
                .font(Theme.shared.buttonFont)
              }.padding()
            }.frame(width: 300, height: 400)
          }
        }
      }
    
    func saveChaupai() {
        SavedChaupaiViewModel().saveChaupai(chaupaiTitle: nameValue, book: pdf, page: page, chaupaiNumber: Int(chaupaiNumberValue) ?? 0)
    }
}
