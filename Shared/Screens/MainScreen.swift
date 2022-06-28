//
//  MainScreen.swift
//  spender
//
//  Created by sano on 6/28/22.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject private var user = User.shared
    
    var body: some View {
        if user.hasInstructionsRead {
            ContentView()
        } else {
            WelcomeScreen()
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
