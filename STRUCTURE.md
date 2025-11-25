# Static App Structure

```
tsamuels/
├── lib/
│   ├── src/
│   │   ├── presentation/            # UI layer
│   │   │   ├── components/         # Reusable UI components
│   │   │   ├── pages/              # Full page screens
│   │   │   ├── providers/          # State management
│   │   │   └── screens/            # Individual screens
│   │   ├── features/               # Feature modules (UI only)
│   │   │   ├── auth/
│   │   │   │   └── presentation/   # Auth UI components
│   │   │   ├── home/
│   │   │   │   └── presentation/   # Home UI components
│   │   │   ├── profile/
│   │   │   │   └── presentation/   # Profile UI components
│   │   │   └── settings/
│   │   │       └── presentation/   # Settings UI components
│   │   ├── shared/                  # Shared utilities
│   │   │   ├── extensions/         # Dart extensions
│   │   │   ├── helpers/            # Utility functions
│   │   │   ├── mixins/             # Dart mixins
│   │   │   └── validators/         # Input validators
│   │   ├── config/                  # Configuration files
│   │   ├── constants/              # App constants
│   │   ├── routes/                  # Navigation routes
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

### Presentation Layer (`lib/src/presentation/`)
- **components/**: Reusable UI components
- **pages/**: Complete page layouts
- **providers/**: State management (BLoC, Provider, Riverpod, etc.)
- **screens/**: Individual screen widgets

### Features (`lib/src/features/`)
UI-only feature modules:
- **auth/presentation/**: Authentication screens and components
- **home/presentation/**: Home page UI components
- **profile/presentation/**: User profile UI components
- **settings/presentation/**: Settings screen UI components

### Shared (`lib/src/shared/`)
- **extensions/**: Dart extension methods
- **helpers/**: Common utility functions
- **mixins/**: Reusable class mixins
- **validators/**: Input validation logic

### Configuration (`lib/src/`)
- **config/**: App configuration files
- **constants/**: App-wide constants
- **routes/**: Navigation routing
- **themes/**: App styling and themes
- **utils/**: General utility functions
- **widgets/**: Custom widget library

### Assets (`assets/`)
Organized by asset type for easy management and access.

### Testing (`test/`)
- **unit/**: Unit tests for utilities and widgets
- **widget/**: Widget testing
- **integration/**: End-to-end testing
- **helpers/**: Test utilities
- **fixtures/**: Test data files
- **mocks/**: Mock implementations

This structure promotes:
- **UI-focused organization** for static apps
- **Component reusability**
- **Maintainable code structure**
- **Easy navigation**
- **Scalable UI architecture**
