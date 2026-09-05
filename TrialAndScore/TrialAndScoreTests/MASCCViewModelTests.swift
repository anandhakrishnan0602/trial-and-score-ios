//
//  MASCCViewModelTests.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 06/09/26.
//

import XCTest
@testable import TrialAndScore

@MainActor
final class MASCCViewModelTests: XCTestCase {

    private func selectMax(_ viewModel: MASCCViewModel) {
        for criterion in viewModel.criteria {
            guard let best = criterion.options.max(by: { $0.points < $1.points }) else { continue }
            viewModel.selections[criterion.id] = best
        }
    }

    private func selectMin(_ viewModel: MASCCViewModel) {
        for criterion in viewModel.criteria {
            guard let worst = criterion.options.min(by: { $0.points < $1.points }) else { continue }
            viewModel.selections[criterion.id] = worst
        }
    }

    func test_allMaxAnswers_scoresTwentySix_lowRisk() {
        let viewModel = MASCCViewModel()
        selectMax(viewModel)

        viewModel.calculate()

        XCTAssertEqual(viewModel.result?.totalScore, 26)
        XCTAssertEqual(viewModel.result?.isLowRisk, true)
    }

    func test_allMinAnswers_scoresZero_highRisk() {
        let viewModel = MASCCViewModel()
        selectMin(viewModel)

        viewModel.calculate()

        XCTAssertEqual(viewModel.result?.totalScore, 3)
        XCTAssertEqual(viewModel.result?.isLowRisk, false)
    }

    func test_incompleteAnswers_doesNotCalculate_showsValidationError() {
        let viewModel = MASCCViewModel()
        // deliberately leave one criterion unanswered
        for criterion in viewModel.criteria.dropLast() {
            if let option = criterion.options.first {
                viewModel.selections[criterion.id] = option
            }
        }

        viewModel.calculate()

        XCTAssertNil(viewModel.result)
        XCTAssertTrue(viewModel.showValidationError)
    }
}
