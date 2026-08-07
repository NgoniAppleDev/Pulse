//
//  APIError.swift
//  Pulse
//
//  Created by Ngoni Katsidzira  on 7/8/2026.
//

import Foundation

enum APIError: Error {
    
    case invalidURL
    case invalidResponse
    case decodingFailed
    case serverError(Int)
}
