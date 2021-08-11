//
//  QuizVM.swift
//  RMQuiz
//
//  Created by Tommy Alpert on 6/29/21.
//

import Foundation
import SwiftUI

class QuizVM: ObservableObject {
  
  @Published var questionCounter : Int
  @Published var selectedAnswer: Int
  @Published var showAlert: Bool
  
  // Quiz logic
  var responseSet: [QuestionResponse] = []
  var correctResponses: Int = 0
  var totalQuestions: Int = 0
  
  // Timer logic
  let defaultTimeRemaining: CGFloat = 10
  @Published var timerActive : Bool = true
  @Published var timeRemaining : CGFloat
  
  init(numQuestions: Int) {
    self.totalQuestions = numQuestions
    questionCounter = 1
    selectedAnswer = 0
    timeRemaining = defaultTimeRemaining
    showAlert = false
  }
}
