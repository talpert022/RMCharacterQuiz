//
//  QuizView.swift
//  RMQuiz_V1
//
//  Created by Tommy Alpert on 6/17/21.
//

import SwiftUI

struct QuizView: View {
  
  @StateObject var quizLogic : QuizVM = QuizVM(numQuestions: 3)
  @StateObject var networkingController : NetworkingController = NetworkingController()
  @State private var quizComplete: Bool = false
  @State private var qIndex = 0
  
  var body: some View {
    
    ZStack {
      
      if networkingController.questions.count < quizLogic.totalQuestions {
        
        ProgressView()
      }
      
      else {
        
        if qIndex == networkingController.questions.count {
          
          ResultsView(responseList: quizLogic.responseSet, score: quizLogic.correctResponses, totQuestions: quizLogic.totalQuestions)
          
        } else {
          VStack() {
            
            Text("Question \(quizLogic.questionCounter)/\(quizLogic.totalQuestions)")
              .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
              .padding(.bottom)
            
            TimerView(isActive: $quizLogic.timerActive, timeRemaining: $quizLogic.timeRemaining)
                                    
            ZStack {
              ForEach(networkingController.questions.indices) { index in
                
                QuestionView(question: $networkingController.questions[quizLogic.totalQuestions-1-index])
                  .fixedSize(horizontal: false, vertical: true)
                  .offset(x: networkingController.questions[quizLogic.totalQuestions-1-index].completed ? 1000 : 0)
                  .rotationEffect(.init(degrees: networkingController.questions[quizLogic.totalQuestions-1-index].completed ? 10 : 0))
                
              }
            }
            .padding()
            
          }
          .alert(isPresented: $quizLogic.showAlert) {
            Alert(title: getAlertTitle(), dismissButton: .default(Text("Next Question"), action: {
              triggerNextQuestion()
            }))
          }
          .environmentObject(quizLogic)
        }
      }
    }
    .onAppear {
      networkingController.getQuestions()
    }
  }
  
  
  func triggerNextQuestion() {
    
    // Record response to the particular question
    quizLogic.responseSet.append(QuestionResponse(question: networkingController.questions[qIndex], answer: quizLogic.selectedAnswer))
    
    // Increment correct answers if correct
    if quizLogic.selectedAnswer == networkingController.questions[qIndex].correctAnswer {
      quizLogic.correctResponses += 1
    }
    
    // Check if quiz should be ended and begin fetching next question
    if quizLogic.questionCounter < quizLogic.totalQuestions {
      quizLogic.questionCounter += 1
      quizLogic.selectedAnswer = 0
      
      //Timer logic
      quizLogic.timeRemaining = 10
      quizLogic.timerActive = true
      
      
      quizLogic.showAlert = false
      
    } else {
      // Trigger some navigation
      quizComplete = true
    }
    
    withAnimation {
      networkingController.questions[qIndex].completed = true
    }
    qIndex += 1
  }
  
  func getAlertTitle() -> Text {
    if quizLogic.timeRemaining == 0 {
      return Text("Time's Up")
    } else {
      return quizLogic.selectedAnswer == networkingController.questions[qIndex].correctAnswer ? Text("Correct") : Text("Wrong")
    }
  }
}

struct QuizView_Previews: PreviewProvider {
  static var previews: some View {
    QuizView()
  }
}
