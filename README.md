# Instagram Services UI — Flutter Assignment 4

A Flutter UI homework project inspired by **Instagram's clean, mobile-first design**. This app includes an Instagram-style feed page and a dedicated **Services** page with icon cards, descriptions, and interactive arrow buttons.

Built with core Flutter widgets only — no backend, no Firebase, no authentication.

---

## Preview

| Services Page | Home Feed |
|:---:|:---:|
| Icon cards with name, description & arrow | Instagram-style post feed with likes |

> UI-only assignment focused on layout, styling, and widget composition.

---

## Features

### Services Page
- Instagram-inspired mobile layout (max-width 450px, centered card frame)
- 6 service items: Help Center, Contact Us, Send Feedback, Report a Problem, Privacy Policy, Terms of Service
- Each item includes:
  - Colored **icon**
  - **Service name**
  - Short **description**
  - Tappable **arrow button**
- Tap feedback via **SnackBar** (no real navigation or API calls)

### Home Page *(from previous assignment)*
- Scrollable Instagram-style feed
- Profile header, post image, action buttons, likes, caption, and time
- Interactive like button with live count update

---

## Tech Stack

- **Flutter** / **Dart**
- **Material 3** design
- Widgets used: `Scaffold`, `AppBar`, `Column`, `Row`, `Text`, `Icon`, `Container`, `Card`, `ListView`, `InkWell`, `SnackBar`

---

## Project Structure

```
lib/
├── main.dart           # App entry point
├── services_page.dart  # Assignment 4 — Services UI
└── home_page.dart      # Previous assignment — Instagram feed

assets/
└── images/             # Post images for the home feed
```

---

## Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed
- A device/emulator or Chrome for web

### Run the app

```bash
git clone https://github.com/Ashurai84/flutter-assignment-4-services-page.git
cd flutter-assignment-4-services-page
flutter pub get
flutter run
```

By default, the app opens the **Services page**. To preview the home feed, update `lib/main.dart`:

```dart
import 'home_page.dart';

home: const HomePage(), // instead of ServicesPage()
```

---

## Assignment Scope

This project intentionally includes **UI only**:

| Included | Not included |
|:---:|:---:|
| Layout & styling | Firebase |
| SnackBar on tap | Database / API |
| Static service list | Login / Auth |
| Like button UI logic | Real contact or feedback |

---

## Author

**Ashutosh Rai**

Flutter Assignment 4 — Services Page UI

---

## License

This project is for educational purposes.
