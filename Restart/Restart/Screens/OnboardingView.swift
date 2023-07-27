//
//  OnboardingView.swift
//  Restart
//
//  Created by Parth Thakkar on 2022-10-21.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: PROPERTY
    @AppStorage("onBoarding") var isOnBoardingActive = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffSet: CGFloat = 0
    @State private var isAnimated: Bool = false
    @State private var imageOffSet: CGSize = .zero
    @State private var indicatorOpcaity: Double = 1.0
    @State private var textTitle: String = "Share."
    
    let hapticFeedBack = UINotificationFeedbackGenerator()
    
    //MARK: Body
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                //MARK: HEADER
                VStack(spacing: 0) {
                    Text(textTitle)
                        .didSetHeadingTitle()
                        .transition(.opacity)
                        .id(textTitle)
                    Text("""
                        It's not how much we give but
                        how much love we to put giving
                        """)
                    .didSetSubTitle()
                    .padding(.horizontal, 10)
                } //: HEADER
                .opacity(isAnimated ? 1: 0)
                .offset(y: isAnimated ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimated)
                
                //MARK: CENTER
                Spacer()
                ZStack{
                    CircleGroupView(shapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffSet.width  * -1)
                        .blur(radius: abs(imageOffSet.width / 5))
                        .animation(.easeOut(duration: 1.0), value: imageOffSet)
                    Image("Character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimated ? 1 : 0)
                        .animation(.easeOut(duration: 1), value: isAnimated)
                        .offset(x: imageOffSet.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffSet.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if abs(imageOffSet.width) <= 150 {
                                        imageOffSet = gesture.translation
                                        withAnimation(.linear(duration: 0.25)) {
                                            indicatorOpcaity = 0
                                            textTitle = "Give."
                                        }
                                    }
                                })
                                .onEnded({ _ in
                                    imageOffSet = .zero
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpcaity = 1
                                        textTitle = "Share."
                                    }
                                })
                        ) //: GESTURE
                        .animation(.easeOut(duration: 1), value: imageOffSet)
                }//: CENTER
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .opacity(isAnimated ? 1 : 0)
                        .animation(.easeOut(duration: 1.0).delay(2), value: isAnimated)
                        .opacity(indicatorOpcaity)
                    , alignment: .bottom
                )
                Spacer()
                
                //MARK: FOOTER
                ZStack {
                    //MARK: 1: Background - Static
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    //MARK: 2: Call-To-Action(Static)
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .offset(x: 20)
                    //MARK: 3: Capsule(Dynamic Width)
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffSet + 80)
                        Spacer()
                    }
                    //MARK: 4: Cricle- Draggbale
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }//: Zstack
                        .foregroundColor(.white)
                        .frame(width: 80.0, height: 80.0, alignment: .center)
                        .offset(x: buttonOffSet)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if gesture.translation.width > 0 && buttonOffSet <= buttonWidth - 80 {
                                        buttonOffSet = gesture.translation.width
                                    }
                                })
                                .onEnded{ _ in
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        if buttonOffSet > buttonWidth / 2 {
                                            hapticFeedBack.notificationOccurred(.success)
                                            buttonOffSet = buttonWidth - 80
                                            actionPlaySound(sound: "chimeup", type: "mp3")
                                            isOnBoardingActive = true
                                        } else {
                                            hapticFeedBack.notificationOccurred(.warning)
                                            buttonOffSet = 0
                                        }
                                    }
                                }
                        ) //: GESTURE
                        Spacer()
                    }//: HStack
                }//:Footer
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimated ? 1 : 0)
                .offset(y: isAnimated ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimated)
            }//: VStack
        }//: Zstack
        .onAppear {
            isAnimated = true
        }
        .preferredColorScheme(.dark)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
