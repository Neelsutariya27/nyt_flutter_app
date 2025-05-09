
# 📰 NYTimes Flutter App

A Flutter app built using **Stacked Architecture (MVVM)** that consumes the New York Times APIs to display and search for articles.

---

## 🚀 Prerequisites

- Flutter SDK **v3.19.6 or higher** (Tested with **Flutter 3.29.3**)
- Dart SDK 3.x
- A valid **NYTimes API Key** – get it from https://developer.nytimes.com/get-started

---

## 📦 Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/Neelsutariya27/nyt_flutter_app.git
cd nyt_flutter_app
```

### 2. Create the `.env` file

At the root of the project, create a file named `.env` and add your NYT API key:

```env
NYT_API_KEY=your_actual_api_key_here
```

---

## 🔧 Run the Project

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Generate required files

This project uses [stacked](https://pub.dev/packages/stacked) with route and dialog generation:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 5. Clean and fetch dependencies again (recommended)

```bash
flutter clean
flutter pub get
```

---

## ▶️ Run the App

```bash
flutter run
```

You can now explore the app with article listing, search functionality, and navigation using Stacked services.

---

## 📂 Features

- MVVM architecture via `stacked`
- Custom loader dialog
- Snackbar for feedback
- NYT Article Search & Most Popular APIs
- Type-safe route navigation using code generation

---

## 💡 Notes

If you change anything in:

- Routes
- Dialog builders
- ViewModels with annotations

You should rerun the build command:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---
