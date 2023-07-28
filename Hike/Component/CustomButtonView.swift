//
//  CustomButtonView.swift
//  Hike
//
//  Created by Admin on 2023-07-27.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(
                    LinearGradient(colors: [
                        .white,
                            .customGreenLight,
                            .customGrayMedium],
                        startPoint: .top,
                        endPoint: .bottom)
                )
                
            Circle()
                .stroke(LinearGradient(colors: [.customGreenLight, .customGrayMedium], startPoint: .top, endPoint: .bottom), lineWidth: 4)
            Image(systemName:"figure.hiking")
                .fontWeight(.black)
                .font(.system(size:30))
                .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
        }//: ZStack
        .frame(width: 58, height: 58)
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
