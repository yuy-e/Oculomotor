//
//  SummaryView.swift
//  Oculomotor
//
//  Created by loaner on 7/14/22.
//

import SwiftUI

struct SummaryView: View {
    @State private var darkMode: Bool = true
    @State private var date = Date()
    var body: some View {
        ScrollView {
            VStack {
                HStack{
                    Text("Summary")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "chart.pie")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
                .padding(.all)
                
                VStack {
                    DatePicker(
                        "Start Date",
                        selection: $date,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                    .datePickerStyle(.graphical)
                .accentColor(.green)
                }
                Spacer()
                Button("DarkMode", action: {
                    darkMode.toggle()
                })
            }
        }
        .preferredColorScheme(darkMode ? .dark : .light)
    }
}

let darkMode: Bool  = true
struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
