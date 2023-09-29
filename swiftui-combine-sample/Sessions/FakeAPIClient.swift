//
//  FakeAPIClient.swift
//  swiftui-combine-sample
//
//  Created by Kakeshin on 2023/09/30.
//

import Foundation
import Combine

final class FakeAPIClient<EndPointType: APIEndPoint>: APIClient {
    func request<T: Decodable>(_ endPoint: EndPointType) -> AnyPublisher<T, Error> {
        let fileName = endPoint.dummyDataName
        return Bundle.main.url(forResource: fileName, withExtension: nil)
            .publisher
            .tryMap { path in
                guard let data = try? Data(contentsOf: path) else {
                    fatalError("Failed to load \(fileName) from bundle.")
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
