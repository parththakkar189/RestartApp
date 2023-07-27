//
//  CircleGroupView.swift
//  Restart
//
//  Created by Parth Thakkar on 2023-02-21.
//

import SwiftUI

struct CircleGroupView: View {
    //MARK: Property
    @State var shapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimated: Bool = false
    //MARK: Body
    var body: some View {
        ZStack{
            Circle()
                .stroke(shapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(shapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260.0, height: 260.0, alignment: .center)
        }//: Zstack
        .blur(radius: isAnimated ? 0 : 10)
        .opacity(isAnimated ? 1 : 0)
        .scaleEffect(isAnimated ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimated)
        .onAppear {
            isAnimated = true
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView(shapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
