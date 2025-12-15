# 📱 Users iOS App

A simple iOS application built with **UIKit + MVVM** demonstrating clean architecture, and proper UI state management, unit tests for ViewModel.

---

## ✨ Features

- Fetch users from a remote API
- Display loading, empty, data, and error states
- Clean separation of concerns (MVVM)
- UIKit-based UI with Auto Layout
- unit tests for ViewModel

---

## 🏗 Architecture

The project follows the **MVVM** pattern:

- **ViewController**
  - Handles UI rendering and user interactions
- **ViewModel**
  - Contains business logic and exposes UI state
- **Service**
  - Responsible for network calls

---


## 🧪 Error Handling

The app gracefully handles:
- Invalid URL
- Network failures
- Decoding errors
- Empty API responses


---

## 📦 Tech Stack

- Swift
- UIKit
- Auto Layout
- URLSession

---

## ▶️ How to Run

1. Open the project in **Xcode**
2. Select an iOS Simulator or a physical device
3. Press **Run** (⌘R)

---

## 📝 Notes

- No third-party dependencies
- Code is written with readability and testability in mind
- Architecture is easy to extend and maintain

---

## 🚀 Possible Improvements

- Implement pull-to-refresh
- Add pagination
- Add retry button on error state
- Introduce caching or offline mode
- modern concurrency (`async/await`)
