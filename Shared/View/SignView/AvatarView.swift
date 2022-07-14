//
//  AvatarView.swift
//  Oculomotor (iOS)
//
//  Created by xg on 7/14/22.
//

import SwiftUI

struct AvatarView: View {
    var body: some View {
        Image("avatar")
            .resizable()
            .frame(width: 80, height: 80)
            .cornerRadius(12)
            .aspectRatio(contentMode: .fit)
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
