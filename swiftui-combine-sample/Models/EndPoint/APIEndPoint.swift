//
//  APIEndPoint.swift
//  swiftui-combine-sample
//
//  Created by Kakeshin on 2023/09/29.
//

import Foundation

protocol APIEndPoint {
    var baseURL: URL { get }
    var method: HttpMethod { get }
    var path: String { get }
    var header: [String:String]? { get }
    var query: [String:Any]? { get }
    var dummyDataName: String { get }
}
