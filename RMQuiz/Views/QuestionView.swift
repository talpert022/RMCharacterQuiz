//
//  QuestionView.swift
//  RMQuiz_V1
//
//  Created by Tommy Alpert on 6/17/21.
//

import SwiftUI

struct QuestionView: View {
  
  @EnvironmentObject var quizLogic : QuizVM
  @Binding var question : Question
  @State var selectedAnswer = 0
  
  var body: some View {
    VStack(spacing: 20) {
      Text(question.questionText)
        .font(.title)
        .fontWeight(.bold)
            
      AnswerView(question: $question, selectedAnswer: $selectedAnswer)
        .frame(height: 350)
      
      Button{
        quizLogic.timerActive = false
        quizLogic.selectedAnswer = selectedAnswer
        quizLogic.showAlert = true
      } label: {
        Text("Submit Answer")
          .frame(width: 280, height: 70)
          .background(Color.blue)
          .foregroundColor(Color.white)
          .cornerRadius(25)
      }
      
    }
    .padding()
    .background(Color.white)
    .cornerRadius(25)
    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
    .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
  }
}

struct QuestionView_Previews: PreviewProvider {
  static var previews: some View {
    QuestionView(question: Binding.constant(sampleData.sampleQuestion1))
      .environmentObject(QuizVM(numQuestions: 3))
  }
}

struct AnswerView: View {
  
  @EnvironmentObject var quizLogic : QuizVM
  @Binding var question : Question
  @Binding var selectedAnswer : Int
  
  var correctAnswerSelected : Bool = false
  
  var imageColumns: [GridItem] = [
    GridItem(.flexible(), spacing: 10),
    GridItem(.flexible(), spacing: 10),
  ]
  
  var textColumns: [GridItem] = [ GridItem(.flexible(), spacing: 10) ]
  
  var body: some View {
    
    if (question.questionType == .CharToImage) {
      LazyVGrid(columns: imageColumns, spacing: 10) {
        ForEach(question.answers, id: \.id) { answer in
          ImageView(withURL: answer.answerText)
            .overlay(
              RoundedRectangle(cornerRadius: 10)
                .stroke(selectedAnswer == answer.id ? Color.blue : Color.black, lineWidth: 3.0)
            )
            .onTapGesture(perform: {
              selectedAnswer = answer.id
            })
        }
        
      } // End lazyVGrid
      .padding([.leading, .trailing], 10)
    }
    
    if question.questionType == .ImageToChar {
      VStack {
        ImageView(withURL: question.questionImage!)
          .aspectRatio(1, contentMode: .fit)
        
        LazyVGrid(columns: textColumns, spacing: 10) {
          ForEach(question.answers, id: \.id) { answer in
            Text(answer.answerText)
              .frame(minWidth: 0, maxWidth: .infinity)
              .frame(height: 30)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(selectedAnswer == answer.id ? Color.blue : Color.black, lineWidth: 3.0)
              )
              .onTapGesture(perform: {
                selectedAnswer = answer.id
              })
          }
        } // End LazyVGrid
        .padding([.leading, .trailing], 10)
      }
    }
    
    if question.questionType == .SampleQuestion {
      LazyVGrid(columns: imageColumns, spacing: 10) {
        ForEach(question.answers, id: \.id) { answer in
          Image(answer.answerText)
            .resizable()
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(minHeight: 100, maxHeight: .infinity)
            .overlay(
              RoundedRectangle(cornerRadius: 10)
                .stroke(selectedAnswer == answer.id ? Color.blue : Color.black, lineWidth: 2.0)
            )
            .onTapGesture(perform: {
              selectedAnswer = answer.id
            })
          
        }
        
      } // End lazyVGrid
      .padding([.leading, .trailing], 10)
    }
  }
}

struct ImageView: View {
  
  @ObservedObject var imageLoader:ImageLoader
  @State var image:UIImage = UIImage()
  
  init(withURL url:String) {
    imageLoader = ImageLoader(urlString:url)
  }
  
  var body: some View {
    Image(uiImage: image)
      .resizable()
      .scaledToFill()
      .frame(minWidth: 0, maxWidth: .infinity)
      .cornerRadius(10)
      .onReceive(imageLoader.didChange) { data in
        self.image = UIImage(data: data) ?? UIImage()
      }
  }
}
