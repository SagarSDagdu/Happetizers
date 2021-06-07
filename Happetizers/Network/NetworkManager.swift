//
//  NetworkManager.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 07/06/21.
//

import Foundation

enum APError: Error {
    case invalidResponse
    case invalidData
    case unableToComplete
    case invalidURL
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizersURL =  baseURL + "appetizers"
    
    private init() { }
    
    func getAppetizers(completion: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let appetizersURL = URL(string: appetizersURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: appetizersURL)) { data, response, error in
            guard error == nil else {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let appetizers = try JSONDecoder().decode(AppetizerResponse.self, from: data)
                completion(.success(appetizers.request))
            } catch {
                completion(.failure(.invalidData))
            }
        }

        task.resume()

    }
}
