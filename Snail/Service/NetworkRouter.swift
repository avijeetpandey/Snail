//
//  NetworkRouter.swift
//  Snail
//
//  Created by Avijeet Pandey on 23/05/23.
//

import Foundation

// MARK: - NetworkRouterCompletion typealias
public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()

// MARK: - NetworkRouterProtocol
protocol NetworkRouter: AnyObject {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
