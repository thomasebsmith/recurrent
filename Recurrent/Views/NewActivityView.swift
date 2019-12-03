//
//  NewActivityView.swift
//  Recurrent
//
//  Created by Thomas Smith on 11/29/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import SwiftUI

struct NewActivityView: View {
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button("Cancel") {
                        print("TODO: Dismiss")
                    }.padding()
                    Spacer()
                }
                Text("New Activity").bold().font(.system(size: 24)).padding()
            }
            Spacer()
        }
    }
}

struct NewActivityView_Previews: PreviewProvider {
    static var previews: some View {
        NewActivityView()
    }
}
