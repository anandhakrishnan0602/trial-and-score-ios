//
//  TrialList.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 05/09/26.
//

import SwiftUI

struct TrialList: View {
    let trials: [Trial]
    var body: some View {
        List(trials) { trial in
            TrialRow(trial: trial)
        }
    }
}

#Preview {
    TrialList(trials: [Trial(id: "1", title: "trial 1", status: "Completed", phase: "Phase 3", leadSponsor: "Instituto Mexicano del Seguro Social")])
}
