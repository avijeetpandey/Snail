//
//  JSONParameterEncoder.swift
//  Snail
//
//  Created by Avijeet Pandey on 23/05/23.
//

import Foundation

// MARK: - JSONParameterEncoder
public struct JSONParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            // Attaching Data to the body of the URL request
            urlRequest.httpBody = jsonAsData
            
            // Encoding the parameters to JSON to add appropriate headers
            if urlRequest.value(forHTTPHeaderField: HTTPHeaderType.contentType.rawValue) == nil {
                urlRequest.setValue(HTTPHeaderType.applicationJSON.rawValue, forHTTPHeaderField: HTTPHeaderType.contentType.rawValue)
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
