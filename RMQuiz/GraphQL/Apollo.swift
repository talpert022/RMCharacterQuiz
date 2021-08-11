//
//  Apollo.swift
//  RMQuiz
//
//  Created by Tommy Alpert on 6/29/21.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()
  lazy var apollo = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
}
