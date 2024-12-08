//
//  SidebarView.swift
//  IDEUIPanels
//
//  Created by Anushka Chokshi on 2024-12-08.
//

import Foundation
import SwiftUI

struct SidebarView: View {
    @State private var isCollapsed: Bool = false
    @State private var selectedEntry: String?

    let files = ["File1.swift", "File2.swift"]
    let folders = ["Folder1", "Folder2"]

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Project Explorer")
                    .font(.headline)
                    .foregroundColor(.gray)
                Spacer()
                Button(action: {
                    withAnimation {
                        isCollapsed.toggle()
                    }
                }) {
                    Image(systemName: isCollapsed ? "sidebar.right" : "sidebar.left")
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)

            if !isCollapsed {
                List {
                    Section(header: Text("Files")) {
                        ForEach(files, id: \.self) { file in
                            HStack {
                                Image(systemName: "doc.text")
                                Text(file)
                            }
                        }
                    }
                    Section(header: Text("Folders")) {
                        ForEach(folders, id: \.self) { folder in
                            HStack {
                                Image(systemName: "folder")
                                Text(folder)
                            }
                        }
                    }
                }
                .listStyle(SidebarListStyle())
            }
        }
        .frame(maxWidth: isCollapsed ? 60 : 250)
        .background(Color(.systemGray6))
        .animation(.easeInOut, value: isCollapsed)
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}


