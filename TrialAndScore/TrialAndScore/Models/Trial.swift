//
//  Trial.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 05/09/26.
//

import Foundation
 
struct Trial: Identifiable, Equatable {
    let id: String
    let title: String
    let status: String
    let phase: String
    let leadSponsor: String
 
    /// Fallback text shown for any field ClinicalTrials.gov didn't return.
    static let placeholder = "Not available"
}
 
// MARK: - Mapping from the raw API model
 
extension Trial {
    /// Returns nil if the study has no NCT ID — without an ID there's nothing
    /// stable to key a list row on, so such a study can't be meaningfully displayed.
    init?(study: Study) {
        guard let nctId = study.protocolSection?.identificationModule?.nctId else {
            return nil
        }
 
        self.id = nctId
        self.title = study.protocolSection?.identificationModule?.briefTitle
            ?? Trial.placeholder
        self.status = study.protocolSection?.statusModule?.overallStatus
            ?? Trial.placeholder
        self.phase = study.protocolSection?.designModule?.phases?.first
            ?? Trial.placeholder
        self.leadSponsor = study.protocolSection?.sponsorCollaboratorsModule?.leadSponsor?.name
            ?? Trial.placeholder
    }
}
