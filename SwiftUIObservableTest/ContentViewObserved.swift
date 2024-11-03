//
//  ContentViewObserved.swift
//  SwiftUIObservableTest
//
//  Created by Arbab Nawaz on 11/3/24.
//

import SwiftUI

#if !OBSERVABLE_MODE_ON

/// This method differs from the  Observation based data model approach as only the subview which depends on the property data is re-drawn
/// while in Observed Data model approach the whole ui re-renders every time there is even one property chagne in the model.
/// - DIscussion : With the previous Observed framwork and published properties the whole view is re drawn every time there is a changed in any property of the model.
struct ContentViewObserved: View {
    var body: some View {
        VStack(spacing: 40) {
            Count1()
            Count2()
        }
        .padding()
    }
}
struct Count1: View {
    @EnvironmentObject private var dataModel: DataModel
    
    var body: some View {
        let _ = Self._printChanges()
        VStack(spacing: 10) {
            IncrementButton(count: $dataModel.count1)
            Text("Count 1: \(dataModel.count1)")
        }
    }
}

struct Count2: View {
    @EnvironmentObject private var dataModel: DataModel
    
    var body: some View {
        let _ = Self._printChanges()
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

#endif
