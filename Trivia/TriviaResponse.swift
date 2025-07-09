//
//  TriviaResponse.swift
//  Trivia
//
//  Created by Joshua Mburu on 7/7/25.
//

import Foundation

struct TriviaResponse: Decodable {
  let results: [TriviaQuestion]
}
