//
//  NetworkManager.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 07/06/21.
//

import Foundation
import UIKit

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
    private let cache = NSCache<NSString, UIImage>()
    
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
    
    func getImage(from url: String, completion: @escaping (UIImage?) -> Void) {
        let key = NSString(string: url)
        if let image = cache.object(forKey: key) {
            completion(image)
            return
        }
        
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let data = data, let image = UIImage(data: data) {
                self?.cache.setObject(image, forKey: key)
                completion(image)
            } else {
                completion(nil)
            }
        }
        
        task.resume()
    }
    
}
