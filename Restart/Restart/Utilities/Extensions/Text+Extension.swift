//
//  Text+Extension.swift
//  Restart
//
//  Created by Parth Thakkar on 2022-10-21.
//

import SwiftUI

extension Text {
    func didSetHeadingTitle() -> some View {
        self
        .font(.system(size: 60))
        .fontWeight(.bold)
        .foregroundColor(.white)
    }
    
    func didSetSubTitle() -> some View {
        self
            .font(.title3)
            .fontWeight(.light)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
    }
}
