//
//  ClinicalTrialResponse.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 04/09/26.
//

// MARK: - Top-level response
struct ClinicalTrialsResponse: Decodable {
    let studies: [Study]
    let nextPageToken: String?
}

// MARK: - Study
 
struct Study: Decodable {
    let protocolSection: ProtocolSection?
}

// MARK: - Protocol Section
 
struct ProtocolSection: Decodable {
    let identificationModule: IdentificationModule?
    let statusModule: StatusModule?
    let designModule: DesignModule?
    let sponsorCollaboratorsModule: SponsorCollaboratorsModule?
}

// MARK: - Identification
 
struct IdentificationModule: Decodable {
    let nctId: String?
    let briefTitle: String?
}
 
// MARK: - Status
 
struct StatusModule: Decodable {
    let overallStatus: String?
}
 
// MARK: - Design
 
struct DesignModule: Decodable {
    let phases: [String]?
}
 
// MARK: - Sponsor / Collaborators
 
struct SponsorCollaboratorsModule: Decodable {
    let leadSponsor: LeadSponsor?
}
 
struct LeadSponsor: Decodable {
    let name: String?
}
