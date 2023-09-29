//
//  AppDataProvider.swift
//  swiftui-combine-sample
//
//  Created by Kakeshin on 2023/09/30.
//

import Foundation
import Combine

protocol AppDataProviderProtocol {
    func getData<T: Decodable>(_ type: T.Type, endPoint: HelloEndPoint) -> AnyPublisher<T, Error>
}

final class AppDataProvider: AppDataProviderProtocol {
    func getData<T: Decodable>(_ type: T.Type, endPoint: HelloEndPoint) -> AnyPublisher<T, Error> {
        return Bundle.main.object(forInfoDictionaryKey: "isFake") as! Bool ?
        FakeAPIClient().request(endPoint) : RestAPIClient().request(endPoint)
    }
}
