//
//  HelloEndPoint.swift
//  swiftui-combine-sample
//
//  Created by Kakeshin on 2023/09/29.
//

import Foundation

enum HelloEndPoint: APIEndPoint {
    case getOneData

    var baseURL: URL {
        return URL(string: "")!
    }

    var path: String {
        switch self {
        case .getOneData: return ""
        }
    }

    var method: HttpMethod {
        switch self {
        case .getOneData: return .get
        }
    }

    var header: [String : String]? {
        return ["Content-Type":"application/json"]
    }

    var query: [String : Any]? {
        return nil
    }

    var dummyDataName: String {
        switch self {
        case .getOneData: return "hello.json"
        }
    }
}
