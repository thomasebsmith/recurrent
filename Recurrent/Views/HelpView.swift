//
//  HelpView.swift
//  Recurrent
//
//  Created by Thomas Smith on 11/29/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import SwiftUI

struct HelpView: View {
    @Binding var isPresented: Bool
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button("Cancel") {
                        self.isPresented.toggle()
                    }.padding()
                    Spacer()
                }
                Text("Help").bold().font(.system(size: 24)).padding()
            }
            Spacer()
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView(isPresented: Binding<Bool>(get: { true }) {_ in })
    }
}
