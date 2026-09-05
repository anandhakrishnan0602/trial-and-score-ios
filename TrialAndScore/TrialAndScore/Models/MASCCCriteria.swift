//
//  MASCCCriteria.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 05/09/26.
//

import Foundation

enum MASCCCriteria {
    static let all: [Criterion] = [
        Criterion(
            id: "burden",
            question: "Burden of febrile neutropenia",
            options: [
                ScoringOption(label: "None or mild symptoms", points: 5),
                ScoringOption(label: "Moderate symptoms", points: 3)
            ]
        ),
        Criterion(
            id: "hypotension",
            question: "No hypotension (systolic BP > 90 mmHg)",
            options: [
                ScoringOption(label: "Yes", points: 5),
                ScoringOption(label: "No", points: 0)
            ]
        ),
        Criterion(
            id: "copd",
            question: "No chronic obstructive pulmonary disease",
            options: [
                ScoringOption(label: "Yes", points: 4),
                ScoringOption(label: "No", points: 0)
            ]
        ),
        Criterion(
            id: "solidTumor",
            question: "Solid tumour / no previous fungal infection",
            options: [
                ScoringOption(label: "Yes", points: 4),
                ScoringOption(label: "No", points: 0)
            ]
        ),
        Criterion(
            id: "dehydration",
            question: "No dehydration requiring IV fluids",
            options: [
                ScoringOption(label: "Yes", points: 3),
                ScoringOption(label: "No", points: 0)
            ]
        ),
        Criterion(
            id: "outpatient",
            question: "Outpatient status at onset of fever",
            options: [
                ScoringOption(label: "Yes", points: 3),
                ScoringOption(label: "No", points: 0)
            ]
        ),
        Criterion(
            id: "age",
            question: "Age < 60 years",
            options: [
                ScoringOption(label: "Yes", points: 2),
                ScoringOption(label: "No", points: 0)
            ]
        )
    ]
}
