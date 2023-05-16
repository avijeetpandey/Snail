//
//  EndPointType.swift
//  Snail
//
//  Created by Avijeet Pandey on 15/05/23.
//

import Foundation

// MARK: - EndPointType
protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
