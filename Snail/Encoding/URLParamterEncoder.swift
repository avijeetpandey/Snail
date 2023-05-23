//
//  URLParamterEncoder.swift
//  Snail
//
//  Created by Avijeet Pandey on 22/05/23.
//

import Foundation

// MARK: - URLParameterEncoder
public struct URLParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else { throw NetworkError.missingUrl }
        
        if var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: false) , !parameters.isEmpty {
            urlComponent.queryItems = [URLQueryItem]()
            
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponent.queryItems?.append(queryItem)
                urlRequest.url = urlComponent.url
            }
        }
        
        /// The above code takes parameters and makes them safe to be passed to the URL
        if urlRequest.value(forHTTPHeaderField: HTTPHeaderType.contentType.rawValue) == nil {
            urlRequest.setValue(HTTPHeaderType.urlFormEncoded.rawValue, forHTTPHeaderField: HTTPHeaderType.contentType.rawValue)
        }
    }
}
