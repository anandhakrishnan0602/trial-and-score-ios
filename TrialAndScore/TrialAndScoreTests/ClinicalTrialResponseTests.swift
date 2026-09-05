//
//  ClinicalTrialResponseTests.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 06/09/26.
//

import XCTest
@testable import TrialAndScore
@MainActor
final class ClinicalTrialResponseTests: XCTestCase {

    private func loadSampleJSON() throws -> Data {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "sample_trials", withExtension: "json") else {
            XCTFail("sample_trials.json not found in test bundle")
            fatalError() // unreachable, but satisfies the compiler's non-optional return
        }
        return try Data(contentsOf: url)
    }

    func test_decodesValidResponse() throws {
        let data = try loadSampleJSON()
        let response = try JSONDecoder().decode(ClinicalTrialsResponse.self, from: data)

        XCTAssertEqual(response.studies.count, 2)
    }
    
    func test_decodesFirstStudyFieldsCorrectly() throws {
        let data = try loadSampleJSON()
        let response = try JSONDecoder().decode(ClinicalTrialsResponse.self, from: data)

        let first = response.studies[0]

        XCTAssertEqual(first.protocolSection?.identificationModule?.nctId, "NCT02305173")
        XCTAssertEqual(
            first.protocolSection?.identificationModule?.briefTitle,
            "Dexamethasone and Respiratory Function After Mastectomy"
        )
        XCTAssertEqual(first.protocolSection?.statusModule?.overallStatus, "COMPLETED")
        XCTAssertEqual(first.protocolSection?.designModule?.phases, ["PHASE3"])
        XCTAssertEqual(
            first.protocolSection?.sponsorCollaboratorsModule?.leadSponsor?.name,
            "Instituto Mexicano del Seguro Social"
        )
    }

    func test_decodesStudyWithMissingPhaseAsNil() throws {
        let data = try loadSampleJSON()
        let response = try JSONDecoder().decode(ClinicalTrialsResponse.self, from: data)

        let second = response.studies[1]

        // designModule is present but empty ({}) in the sample JSON
        XCTAssertNil(second.protocolSection?.designModule?.phases)
    }

    func test_flattenedTrialUsesPlaceholderForMissingPhase() throws {
        let data = try loadSampleJSON()
        let response = try JSONDecoder().decode(ClinicalTrialsResponse.self, from: data)

        let trial = Trial(study: response.studies[1])

        XCTAssertNotNil(trial)
        XCTAssertEqual(trial?.phase, Trial.placeholder)
    }
}
