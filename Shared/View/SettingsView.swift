//
//  SettingsView.swift
//  Oculomotor
//
//  Created by loaner on 7/14/22.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    static let instance = NotificationManager() // singleton
    var targetHour = 16
    var targetMin = 45
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCESS")
            }
        }
    }
    
    func scheduleNotification() {
        requestAuthorization()
        let content = UNMutableNotificationContent()
        content.title = "U should continue to Oculomotor excercise "
        content.subtitle = "It's time for VOR excercise"
        content.sound = .default
        content.badge = 1
        
        //time
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        // calendar
        var dateComponents = DateComponents()
        dateComponents.hour = targetHour
        dateComponents.minute = targetMin
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        //location
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
}


struct SettingsView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var userData: UserData
    
//    @State private var NotificationTime = Date.now
    
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                //MARK: -FORM
                VStack(alignment: .center) {
                    CircleImage()
                    Text(userData.firstName + " " + userData.lastName)
                }
                Form{
                    //MARK: -SECTION2
                    Section(header: Text("Personal Settings")){
                        NavigationLink(destination: SettingsAccountView()
                            .environmentObject(self.userData)) {
                            Text("Account")
                        }
                        Toggle(isOn: $userData.darkMode) {
                            Text("Dark Mode")
                        }
                        DatePicker("Notification time", selection: $userData.NotificationTime, displayedComponents: .hourAndMinute)
                        Button("Schedule permission") {
                            NotificationManager.instance.targetHour = Calendar.current.component(.hour, from: userData.NotificationTime)
                            NotificationManager.instance.targetMin = Calendar.current.component(.minute, from: userData.NotificationTime)
                            NotificationManager.instance.scheduleNotification()
                        }.onAppear{
                            UIApplication.shared.applicationIconBadgeNumber = 0
                        }
                    }
                    
                    
                    //MARK: SECTION 3
                    Section(header: Text("Follow us on social media")) {
                        FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://google.com")
                        FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link:"https://twitter.com" )
                        FormRowLinkView(icon: "play.rectangle", color: Color.green, text: "Courses", link: "https://google.com")
                    }
                    
                    //MARK: SECTION 4
                    
                    Section(header: Text("About the application")) {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Charlie / Suryansh")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Yusha / Yue Yu")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
                    } //: SECTION 4
                    .padding(.vertical, 3)
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                //MARK: - FOOTER
                Text("Copyright @ All rights reserved.\nOculomotor ♡ app")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.secondary)
                
            } //: VSTACK
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
            .preferredColorScheme(userData.darkMode ? .dark : .light)
        } //: NAVIGATION
    }
}

//MARK: - PREVIEW

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .previewDevice("iPhone 13 Pro Max")
            .environmentObject(UserData())
    }
}
