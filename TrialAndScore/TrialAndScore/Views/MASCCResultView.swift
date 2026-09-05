//
//  MASCCResultView.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 05/09/26.
//

import SwiftUI

struct MASCCResultView: View {
    @Environment(\.presentationMode) var presentationMode
    let result: MASCCResult
    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Text(result.isLowRisk ? "LOW RISK" : "HIGH RISK")
                .font(.largeTitle)
                .bold()
                .foregroundColor(result.isLowRisk ? .green : .red)
            Text("Your score is \(result.totalScore) out of 26")                .font(.title2)
            Text(result.interpretation)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            Button("Start Over") {
                presentationMode.wrappedValue.dismiss()
            }
            .buttonStyle(.bordered)
            
            Spacer()
            Spacer()

        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    MASCCResultView(result: MASCCResult(totalScore: 26, isLowRisk: true))
}
