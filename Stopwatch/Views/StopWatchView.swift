//
//  StopWatchView.swift
//  Stopwatch
//
//  Created by Gerd Faedtke on 28.02.23.
//

import SwiftUI
import Combine

struct StopWatchView: View {
    @ObservedObject var stopWatch = StopWatch()
    
    var body: some View {
        VStack {
           
            Text(self.stopWatch.stopWatchTime)
                .font(.custom("courier", size: 60))
                .padding(10)
                
   //             .frame(width: UIScreen.main.bounds.size.width,
   //             height: 300,
   //             alignment: .center
   //             )
            
            HStack {
                StopWatchButtonView(
                    actions: [self.stopWatch.reset, self.stopWatch.lap],
                    labels: ["Reset", "Lap"],
                    color: Color.red,
                    isPaused: self.stopWatch.isPaused())
                
                StopWatchButtonView(
                    actions: [self.stopWatch.start, self.stopWatch.pause],
                    labels: ["Start", "Pause"],
                    color: Color.blue,
                    isPaused: self.stopWatch.isPaused())
            }
            
            VStack(alignment: .leading) {
                Text("Laps")
                    .font(.title)
                    .padding()
                
                List {
                    ForEach(self.stopWatch.laps, id: \.uuid) { (lapItem) in
                        Text(lapItem.stringTime)
                    }
                }
                
            }
        
        }
       
    }
}

struct StopWatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchView()
    }
}
