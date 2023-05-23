//
//  HTTPHeaders.swift
//  Snail
//
//  Created by Avijeet Pandey on 15/05/23.
//

import Foundation

// MARK: - HTTPHeaders
public typealias HTTPHeaders = [String: String]

// MARK: - HTTP Header type
enum HTTPHeaderType: String {
    case contentType = "Content-Type"
case applicationJSON = "application/json"
    case urlFormEncoded = "application/x-www-form-encoded; charset=utf-8"
}
