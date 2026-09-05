//
//  TrialRow.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 05/09/26.
//

import SwiftUI

struct TrialRow: View {
    let trial: Trial
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(trial.title)
                .font(.headline)
            Text(trial.id)
                .font(.caption)
                .foregroundColor(.secondary)
            HStack {
                Text(trial.displayStatus)
                Text("•")
                Text(trial.phase)
            }
            .font(.subheadline)
            Text(trial.leadSponsor)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    TrialRow(trial: Trial(id: "1", title: "trial 1", status: "Completed", phase: "Phase 3", leadSponsor: "Instituto Mexicano del Seguro Social"))
}
