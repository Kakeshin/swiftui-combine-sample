//
//  ContentView.swift
//  swiftui-combine-sample
//
//  Created by Kakeshin on 2023/09/29.
//

import SwiftUI

struct ContentView: View {
    @StateObject var helloStore = HelloStore(dataProvider: AppDataProvider())
    var body: some View {
        VStack {
            Button {
                helloStore.fetchData()
            } label: {
                Text("Tap!!!")
            }
            .padding()
            Spacer()
            if helloStore.data != nil {
                Text(helloStore.data?.name ?? "")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
