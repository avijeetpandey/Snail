//
//  HTTPTask.swift
//  Snail
//
//  Created by Avijeet Pandey on 15/05/23.
//

import Foundation

// MARK: - HTTPTask
public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?,
                           urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?,
                                     urlParameters: Parameters?,
                                     additionalHeaders: HTTPHeaders?)
}
