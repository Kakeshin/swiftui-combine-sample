//
//  HelloEntity.swift
//  swiftui-combine-sample
//
//  Created by Kakeshin on 2023/09/29.
//

struct HelloEntity: Codable {
    let Id: Int
    let name: String

    init(Id: Int, name: String) {
        self.Id = Id
        self.name = name
    }
}
