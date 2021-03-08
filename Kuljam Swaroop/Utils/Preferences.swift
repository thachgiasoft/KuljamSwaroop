//
//  Preferences.swift
//  Kuljam Swaroop
//
//  Created by Dipesh Dhakal on 8/3/21.
//  Copyright © 2021 Nijanand. All rights reserved.
//

import Foundation

class Preference {
    
    static let shared = Preference()
    
    enum Constants: String {
        case chaupaiPreferenceKey = "NIJANAND.SAVED_CHAUPAI_KEY"
    }
    
    public var chaupaiListData: Data? {
        get {
            return UserDefaults.standard.data(forKey: Constants.chaupaiPreferenceKey.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.chaupaiPreferenceKey.rawValue)
        }
    }
    
}

extension UserDefaults
{
    @objc dynamic var chaupaiListData: Data?
    {
        get {
            return data(forKey: Preference.Constants.chaupaiPreferenceKey.rawValue)
        }
        set {
            set(newValue, forKey: Preference.Constants.chaupaiPreferenceKey.rawValue)
        }
    }
}
