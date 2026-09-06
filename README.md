# TrialAndScore

## Architecture

MVVM + Repository, SwiftUI, iOS 15.0 minimum deployment target. Task 1 (Clinical Trials) uses URLSession + Codable for networking, with a Repository and service layer mapping the API's DTO into a flat domain model. Task 2 (MASCC Risk Index) keeps all scoring logic in a ViewModel, with criteria and point values driven from a static Swift data source rather than hardcoded in the UI. The two tasks are wired together with a simple TabView.

## Assumptions & trade-offs

- Task 1's Repository contains only one method, but keeps networking and domain concerns separable if a second data source were added later.

- Committed directly to main since there is only a single linear build with no parallel work streams
- Task 1's search field defaults to "lung cancer" and shows that value in the search bar itself, rather than starting empty with a placeholder. This was a deliberate choice: showing the actual default search term makes it immediately clear to the user why these specific results appeared, at the cost of looking slightly less like a conventional empty search bar.

- static array chosen over plist for criteria data source

## What I'd improve with more time

- Inline error/retry UI for a failed next-page fetch during pagination (currently a failure is silent — the core pagination logic works.

## AI tool disclosure

Built with assistance from Claude desktop for architecture discussion, code review and code generation.

- the project's deployment target is set to iOS 15.0, but I wasn't able to get an iOS 15 simulator device to register in my local Xcode install. So I was not able to test the app in iOS 15.
