//
//  ButtonView.swift
//  Stopwatch
//
//  Created by Gerd Faedtke on 09.03.23.
//

import SwiftUI
import Combine

struct StopWatchButtonView: View {

    var actions: [() -> Void]
    var labels: [String]
    var color: Color
    var isPaused: Bool



    var body: some View {

        let buttonWidth = (UIScreen.main.bounds.size.width / 2) - 12

        return Button(action: {
            if self.isPaused {
                self.actions[0]()
            } else {
                self.actions[1]()
            }
        }) {
            if isPaused {
                Text(self.labels[0])
                    .foregroundColor(Color.white)
                    .frame(width: buttonWidth,
                    height: 50)
            } else {
                Text(self.labels[1])
                    .foregroundColor(Color.white)
                    .frame(width: buttonWidth,
                           height: 50)
            }
        }
        .background(self.color)
    }
}

struct StopWatchButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchButtonView(actions: [], labels: ["Start"], color: .red, isPaused: true)
    }
}
