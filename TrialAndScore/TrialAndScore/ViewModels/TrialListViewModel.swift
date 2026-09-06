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
    
    private var trials: [Trial] = []
    private var nextPageToken: String?
    private var isLoadingNextPage = false

    private let repository: ClinicalTrialsRepository

    init(repository: ClinicalTrialsRepository? = nil) {
        self.repository = repository ?? ClinicalTrialsRepository()
    }

    func loadTrials() async {
        if case .loaded = state, !trials.isEmpty {
            return  // already have results, no need to refetch
        }
        state = .loading
        do {
            let trialsPage = try await repository.fetchTrials(condition: searchText)
            trials = trialsPage.trials
            nextPageToken = trialsPage.nextPageToken
            state = trials.isEmpty ? .empty : .loaded(trials)
        } catch {
            state = .error(error.localizedDescription)
        }
    }
    
    func loadNextPage() async {
        // if by any chance a second call is trigerred when loading next page return
        guard !isLoadingNextPage, let token = nextPageToken else { return }
        isLoadingNextPage = true
        defer { isLoadingNextPage = false }

        do {
            let page = try await repository.fetchTrials(condition: searchText, pageToken: token)
            trials.append(contentsOf: page.trials)
            nextPageToken = page.nextPageToken
            state = .loaded(trials)
        } catch {
            
        }
        
    }
}
