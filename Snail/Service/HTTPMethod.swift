//
//  HTTPMethod.swift
//  Snail
//
//  Created by Avijeet Pandey on 15/05/23.
//

import Foundation

// MARK: - HTTPMethod
/// Enum to hold network request type
public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
