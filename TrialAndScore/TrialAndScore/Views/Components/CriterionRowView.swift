//
//  CriterionRowView.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 05/09/26.
//

import SwiftUI

struct CriterionRowView: View {
    let criterion: Criterion

    @Binding var selectedOption: ScoringOption?
    
    var body: some View {
        VStack(alignment:.leading,spacing: 8) {
            Text(criterion.question)
            
            Picker("",selection: $selectedOption) {
                ForEach(criterion.options) { option in
                    Text(option.label)
                        .padding(10)
                        .tag(option as ScoringOption?)
                    
                    
                        
                }
            }
            .pickerStyle(.segmented)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    CriterionRowView(
        criterion: Criterion(
            id: "12",
            question: "Burden of febrile neutropenia",
            options: [
                ScoringOption(label: "None / mild", points: 5),
                ScoringOption(label: "Moderate", points: 4)
            ]
        ),
        selectedOption: .constant(nil)
    )
}
