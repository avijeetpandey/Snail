//
//  ParameterEncoding.swift
//  Snail
//
//  Created by Avijeet Pandey on 22/05/23.
//

import Foundation

// MARK: - Parameters
public typealias Parameters = [String: Any]

// MARK: - ParameterEncoder
public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

// MARK: - NetworkError
public enum NetworkError: String, Error {
    case parametersNil = "Parameters will nil"
    case encodingFailed = "Parameters encoding failed"
    case missingUrl = "URL is nil"
}
