//
//  ContentView.swift
//  SwiftUIObservableTest
//
//  Created by Arbab Nawaz on 11/3/24.
//

import SwiftUI
#if canImport(Observation)
import Observation
#else
#error("Observation is not available. Please add `Observation` to your project")
#endif

#if OBSERVABLE_MODE_ON

/// With Observation based data model the view only renders partially with the partial data changes. i.e. if only one property of the observed data model chagnes then only the subview which depends on that data is re-drawn
/// @DIscussion: With the previous Observed framwork and published properties the whole view is re drawn every time there is a changed in any property of the model.
struct ContentView: View {
    var body: some View {
        VStack(spacing: 40) {
            Count1()
            Count2()
        }
        .padding()
    }
}

struct Count1: View {
    @Environment(DataModel.self) private var dataModel
    
    var body: some View {
        let _ = Self._printChanges()
        @Bindable var dataModel = dataModel
        VStack(spacing: 10) {
            IncrementButton(count: $dataModel.count1)
            Text("Count 1: \(dataModel.count1)")
        }
    }
}

struct Count2: View {
    @Environment(DataModel.self) private var dataModel
    
    var body: some View {
        let _ = Self._printChanges()
        @Bindable var dataModel = dataModel
        VStack(spacing: 10) {
            IncrementButton(count: $dataModel.count2)
            Text("Count 2: \(dataModel.count2)")
        }
    }
}

struct IncrementButton: View {
    @Binding var count: Int
    
    var body: some View {
        Button("Increment") {
            count += 1
        }
    }
}


#Preview {
    ContentView()
}

#endif
