//
//  MainScreen.swift
//  spender
//
//  Created by sano on 6/28/22.
//

import SwiftUI

struct GuardScreen: View {
    @ObservedObject private var user = User.shared
    
    var body: some View {
        if user.hasInstructionsRead {
            RouterScreen()
        } else {
            WelcomeScreen()
        }
    }
}

struct GuardScreen_Previews: PreviewProvider {
    static var previews: some View {
        GuardScreen()
    }
}
