//
//  UserData.swift
//  Oculomotor
//
//  Created by 罗祥洲 on 2022/7/15.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var darkMode = false
    @Published var firstName: String = "Ethan"
    @Published var lastName: String = "Luo"
    @Published var PhoneNumber: String = "9841111111"
    @Published var UserName: String = "ZEDKIIIING"
    @Published var NotificationTime = Date.now
}
