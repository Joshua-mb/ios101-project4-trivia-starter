//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Joshua Mburu on 7/7/25.
//

import Foundation
class TriviaQuestionService {
  static func fetchQuestions(completion: @escaping ([TriviaQuestion]) -> Void) {
    // You can change amount, type, difficulty, or category here
    let urlString = "https://opentdb.com/api.php?amount=5&type=multiple"
    guard let url = URL(string: urlString) else {
      print("❌ Invalid URL")
      return
    }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      // Handle basic errors
      if let error = error {
        print("❌ Network error:", error.localizedDescription)
        return
      }

      guard let data = data else {
        print("❌ No data returned")
        return
      }

      // Try decoding the response into your models
      do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(TriviaResponse.self, from: data)
        DispatchQueue.main.async {
          completion(response.results)
        }
      } catch {
        print("❌ Decoding error:", error.localizedDescription)
      }
    }

    task.resume()
  }
}
