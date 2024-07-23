# Flutter Assessment
### Steps to run the app locally
#### Step 1: Clone the repository
``` bash
git clone https://github.com/Abel-Mekonen/flutter_assessment
```
#### Step 2: Navigate to the project folder
``` bash
cd flutter_assessment
```

#### Step 3: Install dependencies
``` bash
flutter pub get
```

#### Step 4: Run build runner
``` bash
flutter pub run build_runner build
```

#### Step 2: Run the app
``` bash
flutter run
```


### Folder Structure
```
└── 📁lib
    └── 📁bloc
        └── 📁get_documents
            └── get_documents_bloc.dart
            └── get_documents_bloc.freezed.dart
            └── get_documents_event.dart
            └── get_documents_state.dart
    └── 📁constants
        └── map_configs.dart
    └── 📁data
        └── document_repository.dart
    └── injection.config.dart
    └── injection.dart
    └── main.dart
    └── 📁models
        └── document.dart
        └── file_types.dart
    └── 📁screens
        └── home_overlay.dart
        └── map_view.dart
    └── 📁utils
        └── formatters.dart
        └── widget_to_map_icon.dart
    └── 📁widgets
        └── buttons.dart
        └── cards.dart
        └── containers.dart
        └── markers.dart
        └── text_fields.dart
```
