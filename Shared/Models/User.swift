//
//  User.swift
//  spender
//
//  Created by sano on 6/28/22.
//

import Foundation

class User: ObservableObject {
    @Published var hasInstructionsRead = false
    private let userDefaults = UserDefaults.standard
    private let instructionsKey = "has_instruction_read"
    
    func markInstructionsAsRead() {
        userDefaults.set(true, forKey: instructionsKey)
        hasInstructionsRead = true
    }
    
    static let shared = {
        return User()
    }()
    
    private init() {
        self.hasInstructionsRead = userDefaults.bool(forKey: instructionsKey)
    }
}
