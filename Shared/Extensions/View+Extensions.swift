//
//  View+Extensions.swift
//  Oculomotor (iOS)
//
//  Created by xg on 7/14/22.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
    
    func defaultBackgroundView() -> some View {
        background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9881121516, green: 0.9882771373, blue: 0.9880903363, alpha: 1)), Color.white]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
    }
    
}
