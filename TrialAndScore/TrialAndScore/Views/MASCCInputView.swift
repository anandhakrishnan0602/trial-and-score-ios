//
//  MASCCInputView.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 05/09/26.
//

import SwiftUI

struct MASCCInputView: View {
    @StateObject private var viewModel = MASCCViewModel()
    @State private var navigateToResult = false

    var body: some View {
        NavigationView {
            Form {
                ForEach(viewModel.criteria) { criterion in
                    CriterionRowView(
                        criterion: criterion,
                        selectedOption: Binding(
                            get: { viewModel.selections[criterion.id] },
                            set: { newOption in viewModel.selections[criterion.id] = newOption }
                        )
                    )
                }

                Button {
                    viewModel.calculate()
                    if viewModel.result != nil {
                        // Clearing selections since naviagting to next screen and should be reset when navigating back.
                        viewModel.clearSelections()
                        navigateToResult = true
                    }
                } label: {
                    Text("Calculate")
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                }
                
            }
            .navigationTitle("MASCC Risk Index")
            .alert("Incomplete", isPresented: $viewModel.showValidationError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Please answer all questions before calculating.")
            }
            .background(
                // hidden NavigationLink — triggers on navigateToResult
                NavigationLink(isActive: $navigateToResult) {
                    if let result = viewModel.result {
                        MASCCResultView(result: result)
                    }
                } label: { EmptyView() }
            )
            .onChange(of: navigateToResult) { isActive in
                if !isActive {
                    // fires when navigating back to this screen
                    viewModel.clearResult()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Reset") {
                        viewModel.clearSelections()
                    }
                }
            }
            
        }
    }
}

#Preview {
    MASCCInputView()
}
