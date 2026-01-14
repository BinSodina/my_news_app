# News App - Flutter with GetX & Clean Architecture

A Flutter news application implementing **MVVM Clean Architecture** with **GetX** state management.

## Project Structure

```
lib/
├── data/                          # Data Layer
│   ├── datasources/              # Remote and local data sources
│   │   └── news_remote_datasource.dart
│   ├── models/                   # Data models (extends entities)
│   │   └── news_model.dart
│   └── repositories/             # Repository implementations
│       └── news_repository_impl.dart
│
├── domain/                        # Domain Layer (Business Logic)
│   ├── entities/                 # Plain Dart objects
│   │   └── news_entity.dart
│   ├── repositories/             # Repository interfaces
│   │   └── news_repository.dart
│   └── usecases/                 # Business logic units
│       └── get_news_usecase.dart
│
├── presentation/                  # Presentation Layer
│   ├── bindings/                 # Dependency injection
│   │   └── news_binding.dart
│   ├── controllers/              # GetX controllers (ViewModels)
│   │   └── news/
│   │       └── news_controller.dart
│   └── views/                    # UI screens
│       └── news/
│           └── news_view.dart
│
├── routes/                        # Navigation
│   └── app_routes.dart
│
└── main.dart                      # App entry point
```

## Architecture Layers

### 1. **Data Layer**
- **Models**: Serializable data structures that extend domain entities
- **Data Sources**: Handle API calls and local storage
- **Repository Implementation**: Concrete implementation of domain repositories

### 2. **Domain Layer** (Core Business Logic)
- **Entities**: Pure Dart objects representing business models
- **Repository Interfaces**: Abstract contracts for data operations
- **Use Cases**: Single responsibility business logic operations

### 3. **Presentation Layer**
- **Controllers**: GetX controllers managing state and business logic
- **Views**: UI components that observe controller state
- **Bindings**: Dependency injection setup for each feature

## Key Features

- ✅ **GetX State Management**: Reactive state management with `.obs`
- ✅ **Dependency Injection**: Using GetX bindings
- ✅ **Clean Architecture**: Separation of concerns
- ✅ **MVVM Pattern**: View → Controller → UseCase → Repository
- ✅ **Pull to Refresh**: Swipe down to reload news
- ✅ **Error Handling**: Graceful error states with retry
- ✅ **Loading States**: Loading indicators during data fetch

## Dependencies

```yaml
dependencies:
  get: ^4.6.6           # State management & routing
  http: ^1.2.0          # HTTP client
  get_storage: ^2.1.1   # Local storage
```

## Getting Started

1. **Install dependencies**:
   ```bash
   flutter pub get
   ```

2. **Run the app**:
   ```bash
   flutter run
   ```

## How It Works

### Data Flow
```
View (UI)
    ↕ (observes)
Controller (GetX)
    ↕ (calls)
Use Case
    ↕ (executes)
Repository Interface
    ↕ (implements)
Repository Implementation
    ↕ (fetches from)
Data Source (API/Local)
```

### Example: Fetching News

1. **View** (`news_view.dart`): Displays UI and observes controller state
2. **Controller** (`news_controller.dart`): Manages state with `.obs` observables
3. **Use Case** (`get_news_usecase.dart`): Executes business logic
4. **Repository** (`news_repository_impl.dart`): Fetches data from data source
5. **Data Source** (`news_remote_datasource.dart`): Makes API calls

## Extending the App

### Adding a New Feature

1. **Create the entity** in `domain/entities/`
2. **Create the repository interface** in `domain/repositories/`
3. **Create the use case** in `domain/usecases/`
4. **Create the model** in `data/models/`
5. **Create the data source** in `data/datasources/`
6. **Implement the repository** in `data/repositories/`
7. **Create the controller** in `presentation/controllers/`
8. **Create the view** in `presentation/views/`
9. **Create the binding** in `presentation/bindings/`
10. **Add the route** in `routes/app_routes.dart`

## Notes

- Currently using **mock data** for demonstration
- To connect to a real API, update `news_remote_datasource.dart`
- Add your API key for services like NewsAPI
- Consider adding error models and better error handling
- Add loading skeletons for better UX
- Implement caching with GetStorage if needed

## License

This is a personal project for learning purposes.
