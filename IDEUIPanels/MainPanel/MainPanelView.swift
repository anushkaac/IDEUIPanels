//
//  MainPanelView.swift
//  IDEUIPanels
//
//  Created by Anushka Chokshi on 2024-12-08.
//

import Foundation
import SwiftUI

struct MainPanelView: View {
    @State private var openTabs: [String] = ["File1.swift", "File2.swift"]
    @State private var activeTab: String = "File1.swift"

    var body: some View {
        VStack {
            HStack {
                ForEach(openTabs, id: \.self) { tab in
                    Button(action: {
                        activeTab = tab
                    }) {
                        Text(tab)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(activeTab == tab ? Color.blue.opacity(0.2) : Color.clear)
                            .cornerRadius(10)
                    }
                    .contextMenu {
                        Button("Close Tab") {
                            closeTab(tab)
                        }
                    }
                }
                Spacer()
                Button("+") {
                    openNewTab()
                }
                .font(.headline)
                .padding(.horizontal)
            }
            .padding()
            .background(Color(.systemGray5))

            ZStack {
                ForEach(openTabs, id: \.self) { tab in
                    if activeTab == tab {
                        VStack {
                            Text("Editing \(tab)")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding()
                            Spacer()
                        }
                        .transition(.opacity)
                    }
                }
            }
        }
        .background(Color(.systemGray6))
    }

    func openNewTab() {
        let newTab = "File\(openTabs.count + 1).swift"
        openTabs.append(newTab)
        activeTab = newTab
    }

    func closeTab(_ tab: String) {
        openTabs.removeAll { $0 == tab }
        activeTab = openTabs.last ?? ""
    }
}

struct MainPanelView_Previews: PreviewProvider {
    static var previews: some View {
        MainPanelView()
    }
}


