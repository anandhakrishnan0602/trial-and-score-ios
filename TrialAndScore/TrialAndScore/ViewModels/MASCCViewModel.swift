//
//  MASCCViewModel.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 05/09/26.
//

import Foundation
import Combine

@MainActor
final class MASCCViewModel: ObservableObject {
    let criteria: [Criterion] = MASCCCriteria.all

    @Published var selections: [String: ScoringOption] = [:]
    @Published var result: MASCCResult?
    @Published var showValidationError = false

    var isComplete: Bool {
        selections.count == criteria.count
    }

    func calculate() {
        if isComplete {
            let score = selections.values.reduce(0) { $0 + $1.points }
            result = MASCCResult(totalScore: score, isLowRisk: score >= 21)
        } else {
            showValidationError = true
        }
    }
    
    func clearSelections() {
        selections = [:]
    }

    func clearResult() {
        result = nil
    }}
