# Project Structure

```
tsamuels/
├── lib/
│   ├── src/
│   │   ├── core/                    # Core application logic
│   │   │   ├── errors/             # Custom error classes
│   │   │   ├── network/            # Network configurations
│   │   │   ├── storage/            # Local storage management
│   │   │   └── usecases/           # Business logic use cases
│   │   ├── data/                    # Data layer
│   │   │   ├── datasources/        # Remote and local data sources
│   │   │   ├── entities/           # Data entities
│   │   │   ├── models/             # Data transfer objects
│   │   │   └── repositories/       # Repository implementations
│   │   ├── presentation/            # UI layer
│   │   │   ├── components/         # Reusable UI components
│   │   │   ├── pages/              # Full page screens
│   │   │   ├── providers/          # State management
│   │   │   └── screens/            # Individual screens
│   │   ├── features/               # Feature modules
│   │   │   ├── auth/
│   │   │   │   ├── data/
│   │   │   │   ├── domain/
│   │   │   │   └── presentation/
│   │   │   ├── home/
│   │   │   │   ├── data/
│   │   │   │   ├── domain/
│   │   │   │   └── presentation/
│   │   │   ├── profile/
│   │   │   │   ├── data/
│   │   │   │   ├── domain/
│   │   │   │   └── presentation/
│   │   │   └── settings/
│   │   │       ├── data/
│   │   │       ├── domain/
│   │   │       └── presentation/
│   │   ├── shared/                  # Shared utilities
│   │   │   ├── extensions/         # Dart extensions
│   │   │   ├── helpers/            # Utility functions
│   │   │   ├── mixins/             # Dart mixins
│   │   │   └── validators/         # Input validators
│   │   ├── config/                  # Configuration files
│   │   ├── constants/              # App constants
│   │   ├── models/                  # Global models
│   │   ├── routes/                  # Navigation routes
│   │   ├── services/                # External services
│   │   ├── themes/                  # App themes
│   │   ├── utils/                   # General utilities
│   │   └── widgets/                 # Custom widgets
│   └── main.dart                    # App entry point
├── assets/                          # Static assets
│   ├── images/                     # Image files
│   ├── icons/                      # Icon files
│   ├── fonts/                      # Custom fonts
│   ├── animations/                 # Animation files
│   ├── sounds/                     # Audio files
│   ├── videos/                     # Video files
│   └── data/                       # Static data files
├── test/                           # Test files
│   ├── unit/                       # Unit tests
│   ├── widget/                     # Widget tests
│   ├── integration/                # Integration tests
│   ├── helpers/                    # Test helpers
│   ├── fixtures/                   # Test data
│   └── mocks/                      # Mock objects
├── android/                        # Android platform code
├── ios/                           # iOS platform code
├── web/                           # Web platform code
├── windows/                       # Windows platform code
├── linux/                         # Linux platform code
├── macos/                         # macOS platform code
├── pubspec.yaml                   # Dependencies
├── README.md                      # Project documentation
└── .gitignore                     # Git ignore rules
```

## Directory Purposes

### Core Layer (`lib/src/core/`)
- **errors/**: Custom exception classes
- **network/**: HTTP client, interceptors, network configurations
- **storage/**: Local database, cache management
- **usecases/**: Business logic implementations

### Data Layer (`lib/src/data/`)
- **datasources/**: Remote API calls, local database operations
- **entities/**: Plain data objects
- **models/**: JSON serialization models
- **repositories/**: Repository pattern implementations

### Presentation Layer (`lib/src/presentation/`)
- **components/**: Reusable UI components
- **pages/**: Complete page layouts
- **providers/**: State management (BLoC, Provider, Riverpod, etc.)
- **screens/**: Individual screen widgets

### Features (`lib/src/features/`)
Each feature follows clean architecture:
- **data/**: Feature-specific data layer
- **domain/**: Business logic and entities
- **presentation/**: UI components and screens

### Shared (`lib/src/shared/`)
- **extensions/**: Dart extension methods
- **helpers/**: Common utility functions
- **mixins/**: Reusable class mixins
- **validators/**: Input validation logic

### Assets (`assets/`)
Organized by asset type for easy management and access.

### Testing (`test/`)
- **unit/**: Isolated unit tests
- **widget/**: Widget testing
- **integration/**: End-to-end testing
- **helpers/**: Test utilities
- **fixtures/**: Test data files
- **mocks/**: Mock implementations

This structure promotes:
- **Separation of concerns**
- **Scalability**
- **Maintainability**
- **Testability**
- **Code reusability**
