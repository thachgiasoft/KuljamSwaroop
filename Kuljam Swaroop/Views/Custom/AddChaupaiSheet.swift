//
//  OrderSheet.swift
//  PizzaRestaurant
//
//  Created by Andreas Schultz on 27.09.20.
//

import SwiftUI

struct AddChaupaiSheet: View {
        
    @Environment (\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var chaupaiNumber = ""
    @State var chaupaiName = ""
    
    var pdf: PDFDisplayable
    var pageNumber: Int16
    
    init(pdf: PDFDisplayable, pageNumber: Int16) {
        self.pdf = pdf
        self.pageNumber = pageNumber
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Book Details")) {
                    Text(pdf.navigationTitle)
                    Text("Page number: \(self.pageNumber)")
                }
                
                Section(header: Text("Table")) {
                    TextField("Chaupai Name", text: $chaupaiName)
                        .keyboardType(.numberPad)
                    TextField("Chaupai NUmber", text: $chaupaiNumber)
                        .keyboardType(.numberPad)
                }
                
                Button(action: {
                    guard self.chaupaiName != "" else {return}
                    PersistenceProvider.default.saveChaupai(chaupaiTitle: self.chaupaiName, documentURL: self.pdf.pdfURL.absoluteString, pageNumber: self.pageNumber, chaupaiNumber: Int16(self.chaupaiNumber) ?? 0)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add Chaupai")
                }
            }
                .navigationTitle("Add Chaupai")
        }
    }
}
