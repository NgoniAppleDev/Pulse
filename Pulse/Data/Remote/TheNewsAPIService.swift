//
//  TheNewsAPIService.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation


final class TheNewsAPIService: NewsAPIService {
    
    private let client: NetworkClient
    
    
    init(client: NetworkClient) {
        self.client = client
    }
    
    
    func fetchArticles() async throws -> [ArticleDTO] {
        
        var components = URLComponents(string: "https://api.thenewsapi.com/v1/news/top")!
        
        
        components.queryItems = [
            URLQueryItem(name: "api_token", value: APIConfiguration.newsAPIToken),
            URLQueryItem(name: "language", value: "en")
        ]
        
        
        guard let url = components.url else {
            throw APIError.invalidURL
        }
        
        
        var request = URLRequest(
            url: url
        )
        
        request.httpMethod = "GET"
        
        
        let response: NewsResponseDTO =
        try await client.request(request)
        
        
        return response.data
    }
}
