//
//  HomeView.swift
//  Restart
//
//  Created by Parth Thakkar on 2022-10-21.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onBoarding") var isOnBoardingActive = false
    @State private var isAnimated: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            //MARK: Header
            Spacer()
            ZStack {
                CircleGroupView(shapeColor: .gray, ShapeOpacity: 0.1)
                Image("Character-2")
                    .resizable()
                    .scaledToFit()
                    .offset(y: isAnimated ? 35 : -35)
                    .animation(Animation
                        .easeInOut(duration: 4)
                        .repeatForever()
                        , value: isAnimated)
                .padding()
            }
            //MARK: Center
             Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            //MARK: Footer
            Spacer()
            Button(action: {
                withAnimation {
                    isOnBoardingActive = false
                    actionPlaySound(sound: "success", type: "m4a")
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //: VSTACK
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimated = true
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
