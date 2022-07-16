//
//  PrimaryButtonView.swift
//  Oculomotor (iOS)
//
//  Created by xg on 7/14/22.
//

import SwiftUI

struct PrimaryButtonView: View {
    var title: String
    var backgroundColor: Color
    var fontColor: Color
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(fontColor)
                .frame(maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .cornerRadius(15)
                .shadow(color: backgroundColor.opacity(0.18), radius: 60, x: 0, y: 16)
        }

            
    }
    

}

struct PrimaryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButtonView(title: "Login", backgroundColor: Color("LoginPrimaryColor"), fontColor: Color.white, action: {})
    }
}
