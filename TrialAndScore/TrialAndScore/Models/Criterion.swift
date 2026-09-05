//
//  Criterion.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 05/09/26.
//

struct ScoringOption {
    let label: String
    let points: Int
}

struct Criterion: Identifiable {
    let id: String
    let question: String
    let options: [ScoringOption]
}
