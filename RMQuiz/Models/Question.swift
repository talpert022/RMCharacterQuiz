//
//  Question.swift
//  RMQuiz
//
//  Created by Tommy Alpert on 6/29/21.
//

import Foundation

struct Question {
  
  // Question info
  let questionText: String
  let questionImage: String?
  let correctAnswer: Int
  var answers : [Answer]
  let questionType : QuestionType
  
  // checking question
  var completed = false
    
  init(qText : String, questionImage : String?, options: [String], correctChoice: Int, questionType: QuestionType) {
    self.questionText = qText
    self.questionImage = questionImage
    self.answers = []
    self.correctAnswer = correctChoice
    self.questionType = questionType
    
    for i in 1...options.count {
      let answer = Answer(answerText: options[i-1], id: i, isCorrect: i == correctAnswer ? true : false)
      answers.append(answer)
    }
  }
}

enum QuestionType: CaseIterable {
  case CharToImage
  case ImageToChar
  case SampleQuestion
}

struct Answer {
  
  let answerText: String
  let id: Int
  let isCorrect: Bool
}
