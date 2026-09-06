//
//  TrialListView.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 05/09/26.
//

import SwiftUI

struct TrialListView: View {
    @StateObject private var viewModel = TrialListViewModel()
    
    var body: some View {
        NavigationView {
            content
                .navigationTitle("Clinical Trials")
                .task {
                    await viewModel.loadTrials()
                }
                .searchable(text: $viewModel.searchText)
                .onSubmit(of: .search) {
                    Task {
                        await viewModel.loadTrials()
                    }
                }
        }
        .navigationViewStyle(.stack)
    }
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .empty:
            VStack {
                Text("No Trials Found")
                    .font(.title)
                    .foregroundColor(.secondary)
            }
        case .loaded(let trials):
            TrialList(trials: trials)
        case .error(let message):
            VStack(spacing: 12) {
                Text("Something went wrong")
                    .font(.title2)
                Text(message)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Button("Retry") {
                    Task { await viewModel.loadTrials() }
                }
            }
        }
    }
}
