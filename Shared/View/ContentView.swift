//
//  ContentView.swift
//  Shared
//
//  Created by loaner on 7/12/22.
//

import SwiftUI


/*
    This is the file that will contain all the tabs
 */
struct ContentView: View {
    var body: some View {
        TabView{
            SummaryView()
                .tabItem{
                    Label("Summary", systemImage: "house")
                }
            ExerciseView()
                .tabItem{
                    Label("Exercise", systemImage: "calendar")
                }
            MessageView()
                .tabItem{
                    Label("Messages", systemImage: "message")
                }
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
