//
//  ResultsView.swift
//  RMQuiz_V1
//
//  Created by Tommy Alpert on 6/23/21.
//

import SwiftUI

struct ResultsView: View {
  
  let responseList : [QuestionResponse]
  let score : Int
  let totQuestions : Int
  
  @State private var questionResponseSheet = false
  @Environment(\.presentationMode) var quizSheet
  
  var body: some View {
    
    VStack(spacing: 30) {
      
      VStack(spacing: 10) {
        Text("\(score)/\(totQuestions)")
          .fontWeight(.bold)
          .font(.custom("AlNile", size: 80))
        
        Image("ZeroFace")
          .resizable()
          .scaledToFit()
          .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
        Spacer()
        
        Button{
          quizSheet.wrappedValue.dismiss()
        } label: {
          Text("Go to home")
            .frame(width: 280, height: 70)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(25)
        }
      }
      
      Text("Your Responses: ")
        .fontWeight(.bold)
        .padding()
      
      ScrollView(.vertical) {
        LazyVStack(spacing: 10) {
          ForEach(responseList) { response in
            HStack {
              Text("\(response.question.questionText)")
                .fontWeight(.semibold)
                .padding()
              Spacer()
              Image(systemName: response.isCorrect ? "checkmark" : "xmark")
                .padding()
            }
            .onTapGesture {
              
            }
            
            Divider()
          }
        }
      }.padding()
      
    }
  }
}

struct ResultsView_Previews: PreviewProvider {
  static var previews: some View {
    ResultsView(responseList: MockData.responseData, score: 2, totQuestions: 3)
  }
}
