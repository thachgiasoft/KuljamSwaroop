//
//  DashboardViewModel.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 5/3/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import Firebase
import SwiftUI
import Combine

class DashboardViewModel: ObservableObject {
    
    var reference: DatabaseReference
    
    @Published var chaupais: [RemoteChaupai] = []
    
    init() {
        reference = Database.database().reference().child("Chaupais")
        listChaupais()
    }

    func listChaupais() {
        reference.observe(.value, with: { (snapshot) in
            
            self.chaupais  = []
            var count = 0
            
            for snap in snapshot.children {
                if let snap = snap as? DataSnapshot {
                    let dict = snap.value as! [String: Any]
                    let name = dict["title"] as? String ?? ""
                    let desc = dict["chaupai"] as? String ?? ""
                    self.chaupais.append(RemoteChaupai(id: count, title: name, desc: desc))
                    count += 1
                }
            }
        })
    }
}


struct RemoteChaupai: Identifiable {
    
    var id: Int
    var title: String
    var desc: String

}
