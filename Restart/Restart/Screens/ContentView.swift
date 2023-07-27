//
//  ContentView.swift
//  Restart
//
//  Created by Parth Thakkar on 2022-10-21.
//

import SwiftUI

struct ContentView: View {
    //MARK: PROPERTY
    @AppStorage("onBoarding") var isOnBoardingActive = false
    var body: some View {
        ZStack {
            if isOnBoardingActive {
                HomeView()
            } else {
                OnboardingView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
