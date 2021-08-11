//
//  ContentView.swift
//  RMQuiz
//
//  Created by Tommy Alpert on 6/29/21.
//

import SwiftUI

struct HomeScreen: View {
  
  @State var isShowingQuiz = false
  
  var body: some View {
  
    VStack {
      Text("Rick and Morty Quiz")
        .font(.title)
        .fontWeight(.bold)
        .padding()
      Image("image1")
        .resizable()
        .aspectRatio(contentMode: .fit)
      
      Spacer()
      
      Button() {
        isShowingQuiz.toggle()
      } label: {
        Text("Start Quiz")
        .frame(width: 280, height: 70)
        .background(Color.blue)
        .foregroundColor(Color.white)
        .cornerRadius(25)
      }
      
      Spacer()
      
    }
    .fullScreenCover(isPresented: $isShowingQuiz) {
      QuizView()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
