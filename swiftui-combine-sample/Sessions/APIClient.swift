//
//  APIClient.swift
//  swiftui-combine-sample
//
//  Created by Kakeshin on 2023/09/29.
//

import Combine

protocol APIClient {
    associatedtype EndPointType: APIEndPoint
    func request<T: Decodable>(_ endPoint: EndPointType) -> AnyPublisher<T, Error>
}
