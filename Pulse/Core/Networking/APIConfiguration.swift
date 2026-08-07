//
//  APIConfiguration.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation

enum APIConfiguration {
    
    static var newsAPIToken: String {
        
        guard let token = Bundle.main.object(forInfoDictionaryKey:"THE_NEWS_API_TOKEN") as? String
        else {
            fatalError("Missing THE_NEWS_API_TOKEN")
        }
        
        return token
    }
}
