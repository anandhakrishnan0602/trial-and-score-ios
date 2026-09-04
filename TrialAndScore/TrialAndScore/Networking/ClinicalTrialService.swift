//
//  ClinicalTrialService.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 04/09/26.
//

import Foundation

struct ClinicalTrialsService {
    private let baseURL = "https://clinicaltrials.gov/api/v2/studies"

    private func buildURL(condition: String) -> URL? {
        var components = URLComponents(string: baseURL)

        components?.queryItems = [
            URLQueryItem(name: "query.cond", value: condition),
            URLQueryItem(name: "pageSize", value: "20"),
            URLQueryItem(name: "fields", value: "NCTId,BriefTitle,OverallStatus,Phase,LeadSponsorName")
        ]

        return components?.url
    }

    func fetchTrials(condition: String) async throws -> ClinicalTrialsResponse{
        guard let url = buildURL(condition: condition) else {
            throw ServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw ServiceError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(ClinicalTrialsResponse.self, from: data)
        } catch {
            throw ServiceError.decodingFailed
        }

    }
    
    enum ServiceError: Error {
        case invalidURL
        case invalidResponse
        case decodingFailed
    }
}
