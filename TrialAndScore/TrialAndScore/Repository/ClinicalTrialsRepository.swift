//
//  ClinicalTrialsRepository.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 05/09/26.
//

final class ClinicalTrialsRepository {
    private let service: ClinicalTrialsService

    init(service: ClinicalTrialsService = ClinicalTrialsService()) {
        self.service = service
    }

    func fetchTrials(condition: String) async throws -> [Trial] {
        let trialResponse = try await service.fetchTrials(condition: condition)
        // converting from DTO to Trial model
        let trials = trialResponse.studies.compactMap { Trial(study: $0) }
        return trials
    }
}
