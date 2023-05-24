//
//  Router.swift
//  Snail
//
//  Created by Avijeet Pandey on 23/05/23.
//

import Foundation

// MARK: - Router
class Router<Endpoint: EndPointType> : NetworkRouter {
    // MARK: - properties
    private var task: URLSessionTask?
    
    func request(_ route: Endpoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                completion(data, response, error)
            })
        } catch {
            completion(nil, nil, error)
        }
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    // MARK: - Request building helpers
    fileprivate func buildRequest(from route: Endpoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appending(path: route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        
        request.httpMethod = route.httpMethod.rawValue
        
        do {
            switch route.task {
                case .request:
                    request.setValue(HTTPHeaderType.applicationJSON.rawValue,
                                     forHTTPHeaderField: HTTPHeaderType.contentType.rawValue)
                    
                case .requestParameters(let bodyParamters, let urlParameters):
                    try self.configureBodyParameters(bodyParameters: bodyParamters,
                                                     urlParameters: urlParameters,
                                                     request: &request)
                    
                case .requestParametersAndHeaders(let bodyParameters,
                                                  let urlParameters,
                                                  let additionalHeaders):
                    self.addAdditionalHeaders(additionalHeaders, request: &request)
                    try self.configureBodyParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            }
            return request
        }
    }
    
    fileprivate func configureBodyParameters(bodyParameters: Parameters?,
                                             urlParameters: Parameters?,
                                             request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
            }
            
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &request, with: urlParameters)
            }
            
        } catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
