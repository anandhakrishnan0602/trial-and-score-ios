//
//  TrialDetailView.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 06/09/26.
//

import SwiftUI

struct TrialDetailView: View {
    let trial: Trial

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(trial.title)
                    .font(.title2)
                    .bold()

                Divider()

                DetailRow(label: "NCT ID", value: trial.id)
                DetailRow(label: "Status", value: trial.displayStatus)
                DetailRow(label: "Phase", value: trial.phase)
                DetailRow(label: "Lead Sponsor", value: trial.leadSponsor)
            }
            .padding()
        }
        .navigationTitle("Trial Details")
    }
}

struct DetailRow: View {
    let label: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.body)
        }
    }
}
