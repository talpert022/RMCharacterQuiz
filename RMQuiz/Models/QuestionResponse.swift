//
//  QuestionResponse.swift
//  RMQuiz
//
//  Created by Tommy Alpert on 6/29/21.
//

import Foundation

struct QuestionResponse: Identifiable {
  
  let question : Question
  let chosenAnswer : Int
  let isCorrect: Bool
  let id: UUID = UUID()
  
  init(question: Question, answer: Int) {
    self.question = question
    self.chosenAnswer = answer
    self.isCorrect = chosenAnswer == question.correctAnswer
  }
}

struct MockData {
  
  static let sampleQuestion1 = Question(qText: "This is the first question of the quiz?",
                                        questionImage: nil,
                                        options: ["Right Answer", "Wrong Answer", "Wrong Answer", "Wrong Answer"],
                                        correctChoice: 1,
                                        questionType: .CharToImage)
  
  static let sampleQuestion2 = Question(qText: "This is the second question of the quiz?",
                                        questionImage: nil,
                                        options: ["Wrong Answer", "Wrong Answer", "Right Answer", "Wrong Answer"],
                                        correctChoice: 3,
                                        questionType: .CharToImage)
  
  static let sampleQuestion3 = Question(qText: "This is the third question of the quiz?",
                                        questionImage: nil,
                                        options: ["Wrong Answer", "Wrong Answer", "Wrong Answer", "Right Answer"],
                                        correctChoice: 4,
                                        questionType: .CharToImage)
  
  static let responseData = [QuestionResponse(question: sampleQuestion1, answer: 1),
                             QuestionResponse(question: sampleQuestion2, answer: 2),
                             QuestionResponse(question: sampleQuestion3, answer: 4),
                             QuestionResponse(question: sampleQuestion1, answer: 1),
                             QuestionResponse(question: sampleQuestion2, answer: 2),
                             QuestionResponse(question: sampleQuestion3, answer: 4)]
}

struct sampleData {
  
  static let sampleQuestion1 = Question(qText: "Who is Rick Sanchez?", questionImage: nil, options: ["rickImage", "mortyImage", "summerImage", "bethImage"], correctChoice: 1, questionType: .SampleQuestion)
  static let sampleQuestion2 = Question(qText: "Who is Rick Sanchez?", questionImage: nil, options: ["mortyImage", "rickImage", "summerImage", "bethImage"], correctChoice: 2, questionType: .SampleQuestion)
  static let sampleQuestion3 = Question(qText: "Who is Rick Sanchez?", questionImage: nil, options: ["mortyImage", "summerImage", "rickImage", "bethImage"], correctChoice: 3, questionType: .SampleQuestion)
}
