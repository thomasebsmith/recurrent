//
//  ToolbarView.swift
//  Recurrent
//
//  Created by Thomas Smith on 11/29/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import SwiftUI

struct ToolbarView: View {
    @State var newActivityPopoverPresented = false
    @State var helpPopoverPresented = false
    var body: some View {
        HStack {
            Button(action: {
                self.newActivityPopoverPresented.toggle()
            }) {
                Text("+")
            }.padding().popover(isPresented: $newActivityPopoverPresented) {
                NewActivityView(isPresented: self.$newActivityPopoverPresented)
            }
            Spacer()
            Button(action: {
                self.newActivityPopoverPresented.toggle()
            }) {
                Text("?")
            }.padding().popover(isPresented: $helpPopoverPresented) {
                HelpView(isPresented: self.$helpPopoverPresented)
            }
        }.background(Color("Toolbar"))
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
    }
}
