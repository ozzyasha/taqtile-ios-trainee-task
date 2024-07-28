//
//  DefaultUserImageView.swift
//  taqtile-ios-trainee-task
//
//  Created by Наталья Мазур on 28.07.24.
//

import SwiftUI

struct DefaultUserImageView: View {
    let size: CGFloat
    
    var body: some View {
        ZStack {
            Circle().frame(width: size, height: size)
                .foregroundStyle(Color.gray)
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: size / 3 * 2, height: size / 3 * 2)
                .foregroundStyle(.white)
                .offset(x: 0, y: size / 5)
        }
        .clipShape(Circle())
    }
}

#Preview {
    DefaultUserImageView(size: 50)
}
