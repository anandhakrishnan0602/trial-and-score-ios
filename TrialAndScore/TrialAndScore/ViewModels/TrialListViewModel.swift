//
//  TrialListViewModel.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 05/09/26.
//
import Foundation
import  Combine

@MainActor
final class TrialListViewModel: ObservableObject {
    enum ViewState {
        case loading
        case loaded([Trial])
        case empty
        case error(String)
    }

    @Published private(set) var state: ViewState = .loading
    @Published var searchText: String = "lung cancer"

    private let repository: ClinicalTrialsRepository

    init(repository: ClinicalTrialsRepository? = nil) {
        self.repository = repository ?? ClinicalTrialsRepository()
    }

    func loadTrials() async {
        state = .loading
        do {
            let trials = try await repository.fetchTrials(condition: searchText)
            state = trials.isEmpty ? .empty : .loaded(trials)
        } catch {
            state = .error(error.localizedDescription)
        }
    }
}
