//
//  SwiftUIObservableTestApp.swift
//  SwiftUIObservableTest
//
//  Created by Arbab Nawaz on 11/3/24.
//
import Foundation
import SwiftUI


//#Reference: https://nilcoalescing.com/blog/ObservableInSwiftUI/

//ADD Or Remove this flag from Build Setting 'Active Compilation Condition'
#if targetEnvironment(simulator)
#else
#endif

#if os(macOS)
#else
#endif

#if OBSERVABLE_MODE_ON


@Observable
class DataModel {
    var count1 = 0
    var count2 = 0
}

@main
struct MyApp: App {
    @State private var dataModel = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataModel)
        }
    }
}

#else

class DataModel: ObservableObject {
    @Published var count1 = 0
    @Published var count2 = 0
}

@main
struct MyApp: App {
    @StateObject private var dataModel = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentViewObserved()
                .environmentObject(dataModel)
        }
    }
}

#endif
