**Notes:**

- This project uses the MVVM (Model-View-ViewModel) architecture for scalable Flutter development.

# cabinet_app

**Project Structure:**

- `lib/core/` – Core layer (constants, network, router, utils)
  - `constants/` – App-wide constant values
  - `network/` – Network configuration and clients
  - `router/` – App routing setup
  - `utils/` – Utility functions and helpers
- `lib/data/` – Data layer (models, repositories, services)
  - `models/` – Data models
  - `repositories/` – Data repositories
  - `service/` – Data services
- `lib/domain/` – Domain layer (business logic)
  - `repositories/` – Domain repositories
  - `use_cases/` – Business use cases
- `lib/presentation/` – Presentation layer (UI and state)
  - `state/` – State management
  - `view/` – UI screens
  - `view_models/` – ViewModels for UI
  - `widgets/` – Reusable widgets
- `main.dart` – App entry point
- `test/` – Unit/widget tests

For instructions integrating Flutter modules to your existing applications,
see the [add-to-app documentation](https://flutter.dev/to/add-to-app).

Example structure:

```
lib/
├── core/                # App-wide constants, mock data, themes, utilities
│   └── constants/       # e.g., mock_data.dart
├── data/                # (If present) Data sources, repositories, models
├── domain/              # Business logic: use cases, domain models, interfaces
├── features/            # Feature-based grouping for modularity
│   └── auth/            # Authentication feature (data, presentation, providers)
│   └── home/            # Home feature (data, presentation, providers)
├── presentation/        # UI: views, widgets, state/viewmodels (sometimes inside features)
├── routing/             # App-wide routing (GoRouter, guards, notifiers)
├── widgets/             # Reusable UI components (e.g., AppTextField)

```
