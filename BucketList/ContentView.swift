//
//  ContentView.swift
//  BucketList
//
//  Created by Simran Preet Narang on 2022-06-17.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
  
  @State private var isUnlocked = false
  
  var body: some View {
    VStack {
      if isUnlocked {
        Text("Unlocked")
      } else {
        Text("Locked")
      }
    }
    .onAppear {
      authenticate()
    }    
  }
  
  func authenticate() {
    let context = LAContext()
    var error: NSError?
    
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
      let reason = "We need to unlock your data."
      context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
        if success {
          // Authenticated successfully
          isUnlocked = true
        } else {
          // Error
        }
      }
    } else {
      // No Biometrics available or have not enrolled.
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
