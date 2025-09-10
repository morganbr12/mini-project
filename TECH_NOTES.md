# TECH_NOTES.md

## Architecture
- **State Management:** Provider is used for app-wide state, keeping business logic decoupled from UI.
- **Networking:** Dio is used for all data fetching, even for local assets, to simulate real-world API usage.
- **Persistence:** shared_preferences caches business data after first load, enabling offline access.
- **UI:** BusinessCard is a reusable, generic widget for displaying business (and other) models. The UI is modular and ready for extension.
- **Domain Model:** Messy JSON keys are normalized into a clean Business model with validation.

## Key Trade-offs
- **Dio for Local Data:** Using Dio for local JSON is artificial but required by the brief. In production, asset loading would use rootBundle directly or a real API endpoint.
- **Persistence Simplicity:** shared_preferences is used for simplicity and speed, but a database (like Hive or Drift) would be better for complex or large data.
- **Minimal Error Handling:** Error and retry states are present, but more granular error reporting and user feedback could be added.
- **No Comments:** Code is intentionally comment-free as requested, which may reduce maintainability.

## Improvements with More Time
- Add navigation and detail view for each business.
- Add ServiceCard and demonstrate BusinessCard composition with other models.
- Add tests for provider logic and UI.
- Use a local database for more robust persistence.
- Add animations and polish to the UI.
- Support editing and adding businesses.
- Improve error handling and user feedback.
- Add localization and accessibility features.
