//
//  RestAPIClient.swift
//  swiftui-combine-sample
//
//  Created by Kakeshin on 2023/09/30.
//

import Foundation
import Combine

final class RestAPIClient<EndPointType: APIEndPoint>: APIClient {
    func request<T: Decodable>(_ endPoint: EndPointType) -> AnyPublisher<T, Error> {
        let url = endPoint.baseURL.appendingPathComponent(endPoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue

        endPoint.header?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let response = response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else {
                    throw APIError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
