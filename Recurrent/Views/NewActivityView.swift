//
//  NewActivityView.swift
//  Recurrent
//
//  Created by Thomas Smith on 11/29/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import SwiftUI

struct NewActivityView: View {
    @Binding var isPresented: Bool
    @State var title = ""
    @State var startDate = Date()
    @State var endDate = Date(timeIntervalSinceNow: 60.0*60.0)
    @State var bgColor = Color.blue
    @State var fgColor = Color.white
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button("Cancel") {
                        self.isPresented.toggle()
                    }.padding()
                    Spacer()
                }
                Text("New Activity").bold().font(Font.system(size: 24)).padding()
                HStack {
                    Spacer()
                    Button("Create") {
                        // TODO: Create the activity
                        self.isPresented.toggle()
                    }.padding().disabled(title.isEmpty)
                }
            }
            VStack {
                TextField("Title", text: self.$title)
                DatePicker("Start", selection: self.$startDate, displayedComponents: [.date, .hourAndMinute])
                DatePicker("End", selection: self.$endDate, displayedComponents: [.date, .hourAndMinute])
                ColorPicker("Background Color", selection: self.$bgColor)
                ColorPicker("Foreground Color", selection: self.$fgColor)
                Spacer()
            }.padding()
        }
    }
}

struct NewActivityView_Previews: PreviewProvider {
    static var previews: some View {
        NewActivityView(isPresented: Binding<Bool>(get: { true }) {_ in })
    }
}
