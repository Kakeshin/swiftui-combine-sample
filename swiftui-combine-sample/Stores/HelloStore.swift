//
//  HelloStore.swift
//  swiftui-combine-sample
//
//  Created by Kakeshin on 2023/09/29.
//

import Foundation
import Combine

final class HelloStore: ObservableObject {
    @Published var data: HelloEntity? = nil
    private var cancellables = Set<AnyCancellable>()
    private let dataProvider: AppDataProviderProtocol

    init(dataProvider: AppDataProviderProtocol) {
        self.dataProvider = dataProvider
    }

    func fetchData() {
        dataProvider.getData(HelloEntity.self, endPoint: .getOneData)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let e):
                    fatalError("\(e)")
                }
            },
                  receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.data = data
            })
            .store(in: &cancellables)
    }
}
