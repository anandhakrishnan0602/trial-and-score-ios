//
//  Criterion.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 05/09/26.
//

import Foundation

struct ScoringOption:Identifiable, Hashable {
    let id = UUID()
    let label: String
    let points: Int
}

struct Criterion: Identifiable {
    let id: String
    let question: String
    let options: [ScoringOption]
}
