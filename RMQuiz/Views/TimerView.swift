//
//  TimerView.swift
//  RMQuiz
//
//  Created by Tommy Alpert on 7/27/21.
//

import SwiftUI

let defaultTimeRemaining: CGFloat = 10
let lineWidth: CGFloat = 15
let radius: CGFloat = 50

struct TimerView: View {
  
  @EnvironmentObject var quizLogic : QuizVM
  @Binding var isActive : Bool
  @Binding var timeRemaining: CGFloat
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
  var body: some View {
    
    ZStack {
      Circle()
        .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
      Circle()
        .trim(from: 0, to: 1 - ((defaultTimeRemaining - timeRemaining) / defaultTimeRemaining))
        .stroke(Color.green, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
        .rotationEffect(.degrees(-90))
        .animation(.easeInOut)
      Text("\(Int(timeRemaining))")
        .font(.largeTitle)
      
    }
    .frame(width: radius * 2, height: radius * 2)
    .onReceive(timer, perform: { _ in
      
      guard isActive else { return }
      if timeRemaining > 0 {
        timeRemaining -= 1
      } else {
        isActive = false
        quizLogic.showAlert = true
      }
      
    })
  }
}

struct TimerView_Previews: PreviewProvider {
  static var previews: some View {
    TimerView(isActive: .constant(true), timeRemaining: .constant(10))
  }
}
