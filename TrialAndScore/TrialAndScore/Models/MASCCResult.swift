//
//  MASCCResult.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 05/09/26.
//

struct MASCCResult {
    let totalScore: Int
    let isLowRisk: Bool

    var interpretation: String {
        isLowRisk
            ? "Low risk of serious complications from febrile neutropenia."
            : "High risk of serious complications from febrile neutropenia — closer monitoring is recommended."
    }
}   
