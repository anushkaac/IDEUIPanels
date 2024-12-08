//
//  ContentView.swift
//  IDEUIPanels
//
//  Created by Anushka Chokshi on 2024-12-08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(spacing: 0) {
            SidebarView()
            VStack(spacing: 0) {
                MainPanelView()
                BottomPanelView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGray6))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

