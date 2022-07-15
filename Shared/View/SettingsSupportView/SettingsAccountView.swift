//
//  SettingsAccountView.swift
//  Oculomotor
//
//  Created by 罗祥洲 on 2022/7/15.
//

import SwiftUI

struct SettingsAccountView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var userData: UserData
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                //MARK: -FORM
                VStack(alignment: .center) {
                    CircleImage()
                    Text("Set New Photo").foregroundColor(Color.blue)
                }
                Form{
                    //MARK: -SECTION2
                    Section(header: Text("Personal Information")){
                        TextEditor(text: $userData.firstName)
                        TextEditor(text: $userData.lastName)
                        
                    }
                    
                    
                    //MARK: SECTION 3
                    Section(header: Text("Personal Contact Information")) {
                        VStack {
                            HStack{
                                Text("Phone Number")
                                Spacer()
                                Spacer()
                                Spacer()
                                TextEditor(text: $userData.PhoneNumber)
                            }
                            HStack{
                                Text("User Name")
                                Spacer()
                                Spacer()
                                Spacer()
                                TextEditor(text: $userData.UserName)
                            }
                        }
                    }
                    
                    //MARK: SECTION 4
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Log out".uppercased())
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.red)
                            .font(.headline)
                    })
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
        } //: NAVIGATION
    }
}

struct SettingsAccountView_Previews: PreviewProvider {
    static var previews: some View {
        var userData = UserData()
        SettingsAccountView()
            .environmentObject(userData)
    }
}
