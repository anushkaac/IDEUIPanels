//
//  BottomPanelView.swift
//  IDEUIPanels
//
//  Created by Anushka Chokshi on 2024-12-08.
//

import Foundation
import SwiftUI

struct BottomPanelView: View {
    @State private var logs: [(String, String)] = [
        ("[INFO]", "Build succeeded."),
        ("[ERROR]", "Missing file in the project."),
        ("[WARNING]", "Deprecated API usage.")
    ]

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Console")
                    .font(.headline)
                    .padding(.leading)
                Spacer()
                Button("Clear") {
                    logs.removeAll()
                }
                .padding(.trailing)
            }
            .background(Color(.systemGray5))
            .frame(height: 40)

            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(logs, id: \.1) { log in
                        HStack {
                            Text(log.0)
                                .foregroundColor(colorForLogType(log.0))
                                .bold()
                            Text(log.1)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .background(Color.black)
        }
    }

    func colorForLogType(_ type: String) -> Color {
        switch type {
        case "[INFO]": return .green
        case "[ERROR]": return .red
        case "[WARNING]": return .yellow
        default: return .white
        }
    }
}

struct BottomPanelView_Previews: PreviewProvider {
    static var previews: some View {
        BottomPanelView()
    }
}

