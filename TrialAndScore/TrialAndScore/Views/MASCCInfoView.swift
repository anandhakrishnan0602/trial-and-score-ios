//
//  MASCCInfoView.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 06/09/26.
//

import SwiftUI

struct MASCCInfoView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("About the MASCC Risk Index")
                        .font(.title2)
                        .bold()

                    Text("The Multinational Association for Supportive Care in Cancer (MASCC) Risk Index is a validated clinical tool used to identify cancer patients with febrile neutropenia who are at low risk of serious medical complications.")

                    Text("Scoring")
                        .font(.headline)

                    Text("Each of the 7 criteria contributes points toward a maximum score of 26. A total score of 21 or higher indicates low risk of serious complications; a score below 21 indicates high risk.")

                    Text("This tool is intended to support, not replace, clinical judgment.")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}
