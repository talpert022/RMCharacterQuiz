//
//  networkingController.swift
//  RMQuiz_V2
//
//  Created by Tommy Alpert on 6/28/21.
//

import Foundation
import Combine
import Apollo

class NetworkingController: ObservableObject {
  
  private var usedCharacters : [Int] = []
  @Published var questions : [Question] = []
  
  func getQuestions() {
    for _ in 1...3 {
      setNextQuestion()
    }
  }
  
  func setNextQuestion() {
    
    // Set question type enum
    let questionType = QuestionType.allCases.randomElement()!
    
    // Make right network calls based on question type
    switch questionType {
    case .CharToImage:
      setQuestionType1()
    case .ImageToChar:
      setQuestionType2()
    case .SampleQuestion:
      setQuestionType2()
    }
    
  }
  
  
  func setQuestionType1() {
    
    //Creates 4 graphQL queries for characters with unique IDs from pervious questions
    var querySet : [GraphQLID] = []
    for _ in 0...3 {
      var charID = 0
      while (charID == 0 || usedCharacters.contains(charID)) {
        charID = Int.random(in: 1...671)
      }
      usedCharacters.append(charID)
      querySet.append(GraphQLID(charID))
    }
    
    // Peform network call for characters
    Network.shared.apollo.fetch(query: CharactersQuestionQuery(ids: querySet)) { result in
      
      switch result {
      case .success(let graphQLResult):
      
        guard let characters = graphQLResult.data?.charactersByIds else {
          print("Invalid data")
          return
        }
        
        // Catches invalid data and checks if there are 4 characters
        guard characters.count == 4 else {
          print("Not enough characters returned")
          return
        }
        
        // Turn into question logic
        let correctAnswerIndex = Int.random(in: 0...3)
        let questionString = "Which character is \(String(describing: characters[correctAnswerIndex]!.name!))?"
        let answers = characters.map{ $0!.image! }
        let question = Question(qText: questionString, questionImage: nil, options: answers, correctChoice: correctAnswerIndex+1, questionType: .CharToImage)
        self.questions.append(question)
        
      case .failure(let error):
        print("Character Question Error:  \(error)")
      }
  
    }
    
  }
  
  func setQuestionType2() {
    
    //Creates 4 graphQL queries for characters with unique IDs from pervious questions
    var querySet : [GraphQLID] = []
    for _ in 0...3 {
      var charID = 0
      while (charID == 0 || usedCharacters.contains(charID)) {
        charID = Int.random(in: 1...671)
      }
      usedCharacters.append(charID)
      querySet.append(GraphQLID(charID))
    }
    
    // Peform network call for characters
    Network.shared.apollo.fetch(query: CharactersQuestionQuery(ids: querySet)) { result in
      
      switch result {
      case .success(let graphQLResult):
      
        guard let characters = graphQLResult.data?.charactersByIds else {
          print("Invalid data")
          return
        }
        
        // Catches invalid data and checks if there are 4 characters
        guard characters.count == 4 else {
          print("Not enough characters returned")
          return
        }
        
        // Turn into question logic
        let correctAnswerIndex = Int.random(in: 0...3)
        let questionString = "Who is the following character?"
        let questionImage = "\(characters[correctAnswerIndex]!.image!)"
        let answers = characters.map{ $0!.name! }
        let question = Question(qText: questionString, questionImage: questionImage, options: answers, correctChoice: correctAnswerIndex+1, questionType: .ImageToChar)
        self.questions.append(question)
        
      case .failure(let error):
        print("Character Question Error:  \(error)")
      }
  
    }
    
  }
  
}
