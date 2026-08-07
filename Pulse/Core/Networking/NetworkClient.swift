//
//  NetworkClient.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation

protocol NetworkClient {
    
    func request<T: Decodable>(_ urlRequest: URLRequest) async throws -> T
}


final class URLSessionNetworkClient: NetworkClient {
    
    func request<T: Decodable>(_ urlRequest: URLRequest) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        guard 200..<300 ~= httpResponse.statusCode else {
            throw APIError.serverError(httpResponse.statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            
            decoder.dateDecodingStrategy = .iso8601
            
            
            return try decoder.decode(
                T.self,
                from: data
            )
        } catch {
            
            throw APIError.decodingFailed
        }
    }
}
