//
//  NetworkManager.swift
//  S-Works
//
//  Created by Prabhakar Patil on 28/11/20.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    private let urlSession = URLSession.shared
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        return jsonDecoder
    }()
    
    // MARK:- Service Calls
    
    /// Generic function to fetch and decode the data
    /// - Parameters:
    ///   - url: URL
    ///   - completion: @escaping (Result<T, NetworkError>) -> Void)
    func fetchData<T: Codable>(url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(.failure(.invalidEndPoint))
            return
        }
        
        guard let url = urlComponents.url else {
            completion(.failure(.invalidEndPoint))
            return
        }
        
        urlSession.dataTask(with: url) { (result)  in
            switch result {
            case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                do {
                    let values = try self.jsonDecoder.decode(T.self, from: data)
                    completion(.success(values))
                } catch (let error) {
                    print("Error: \(error)")
                    completion(.failure(.decodeError))
                }
            case .failure(_):
                completion(.failure(.apiError))
            }
        }.resume()
    }
    
}
