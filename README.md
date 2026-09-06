# TrialAndScore

## Architecture

MVVM + Repository, SwiftUI, iOS 15.0 minimum deployment target. Task 1 (Clinical Trials) uses URLSession + Codable for networking, with a Repository and service layer mapping the API's DTO into a flat domain model. Task 2 (MASCC Risk Index) keeps all scoring logic in a ViewModel, with criteria and point values driven from a static Swift data source rather than hardcoded in the UI. The two tasks are wired together with a simple TabView.

## Assumptions & trade-offs

- Task 1's Repository contains only one method, but keeps networking and domain concerns separable if a second data source were added later.

- Committed directly to main since there is only a single linear build with no parallel work streams

## What I'd improve with more time

- Inline error/retry UI for a failed next-page fetch during pagination (currently a failure is
  silent — the core pagination logic works, but surfacing it would require passing the ViewModel
  into TrialList rather than a plain array, which felt like a larger structural change for the
  remaining time).

## AI tool disclosure

Built with assistance from Claude desktop for architecture discussion, code review and code generation.
