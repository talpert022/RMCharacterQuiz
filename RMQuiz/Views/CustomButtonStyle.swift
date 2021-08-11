//
//  CustomButtonStyle.swift
//  RMQuiz
//
//  Created by Tommy Alpert on 6/29/21.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
  
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .frame(width: 230, height: 80)
      .background(Color.blue)
      .foregroundColor(Color.white)
      .cornerRadius(25)
      .overlay(
        RoundedRectangle(cornerRadius: 25)
          .stroke(Color.green, lineWidth: 5))
  }
  
}
