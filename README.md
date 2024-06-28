# Fibonacci List

A Flutter application that displays a list of Fibonacci numbers with interactive features.

## Features

- Displays a scrollable list of at least the first 40 Fibonacci numbers
- Each number is shown with its index and an icon representing its type (circle, square, or cross)
- Tap on a number to open a bottom sheet with filtered items of the same type
- Move items between the main list and the bottom sheet
- Highlight newly added items in the main list and scroll to them
- Reset functionality to restore the initial state

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- An IDE (e.g., Android Studio, VSCode) with Flutter plugins installed

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/fibonacci_list.git
   ```

2. Navigate to the project directory:
   ```
   cd fibonacci_list
   ```

3. Get the dependencies:
   ```
   flutter pub get
   ```

### Running the App

To run the app on a connected device or emulator:

```
flutter run
```

## Running Tests

To run all the tests:

```
flutter test
```

To run a specific test file:

```
flutter test test/path_to_test_file.dart
```

## Project Structure

```
fibonacci_app/
├── lib/
│   ├── main.dart
│   ├── app.dart
│   ├── screens/
│   │   └── fibonacci_list_screen.dart
│   ├── models/
│   │   └── fibonacci_item.dart
│   ├── widgets/
│   │   ├── fibonacci_bottom_sheet.dart
│   │   └── scroll_to_index_util.dart
│   └── utils/
│       └── fibonacci_utils.dart
├── test/
    ├── enums/
    │   └── fibonacci_type_test.dart
    ├── models/
    │   └── fibonacci_item_test.dart
    ├── screens/
    │   └── fibonacci_list_screen_test.dart
    ├── utils/
    │   └── fibonacci_utils_test.dart
    ├── widgets/
    │   └── fibonacci_bottom_sheet_test.dart
    ├── app_test.dart
    └── main_test.dart
```
