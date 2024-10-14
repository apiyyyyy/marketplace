//
//  RESTConfig.swift
//  BelsMarketplace
//
//  Created by Afi Permana on 08/09/24.
//

import Alamofire
import SwiftyJSON
import Foundation
import Combine




class RESTConfig<EndpointType: APIEndpoint>: APIClient {
    func request<T>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> where T : Decodable {
        var url = endpoint.baseURL.appending(path: endpoint.path)
       
        if endpoint.parameters != nil {
            url.append(queryItems: endpoint.parameters!)
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = endpoint.method.rawValue
        endpoint.headers?.forEach {request.addValue($0.value, forHTTPHeaderField: $0.key)}
        print("piy request \(request) && endpoint \(endpoint)")
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("error response \(response)")
                    throw APIError.INVALID_RESPONSE
                }
                print("piy data \(data)")
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}


protocol APIEndpoint {
    var baseURL: URL {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var headers: [String:String]? {get}
    var parameters: [URLQueryItem]? {get}
}

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
}

enum APIError: Error {
    case INVALID_RESPONSE
    case INVALID_DATA
}

protocol APIClient {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}


