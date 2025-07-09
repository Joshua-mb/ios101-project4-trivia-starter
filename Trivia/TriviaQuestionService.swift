//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Joshua Mburu on 7/7/25.
//

import Foundation
class TriviaQuestionService {
  static func fetchQuestions(completion: @escaping ([TriviaQuestion]) -> Void) {
    let urlString = "https://opentdb.com/api.php?amount=5&type=multiple"
    guard let url = URL(string: urlString) else {
      print("error")
      return
    }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error {
        print("error")
        return
      }

      guard let data = data else {
        print("Error")
        return
      }

      do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(TriviaResponse.self, from: data)
        DispatchQueue.main.async {
          completion(response.results)
        }
      } catch {
        print("error")
      }
    }

    task.resume()
  }
}
