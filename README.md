# README

## Project Setup Instructions

This guide provides the necessary steps to set up the project with or without **FVM** (Flutter Version Management). Follow the instructions based on your environment.

---

### Using FVM (Recommended)

1. **Install the Required Flutter Version:**
   ```bash
   fvm use 3.24.5
   ```

2. **Clean the Flutter Project:**
   ```bash
   fvm flutter clean
   ```

3. **Fetch Project Dependencies:**
   ```bash
   fvm flutter pub get
   ```

4. **Generate Code with Build Runner:**
   ```bash
   fvm dart run build_runner build --delete-conflicting-outputs
   ```

5. **Generate Localization Files:**
   ```bash
   fvm dart run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart
   ```

---

### Without FVM

1. **Ensure You Are Using Flutter v3.24.5:**
   Install and use Flutter version 3.24.5 manually if FVM is not installed.

2. **Clean the Flutter Project:**
   ```bash
   flutter clean
   ```

3. **Fetch Project Dependencies:**
   ```bash
   flutter pub get
   ```

4. **Generate Code with Build Runner:**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Generate Localization Files:**
   ```bash
   dart run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart
   ```

---

### Notes

- **FVM:** Flutter Version Management helps manage multiple Flutter versions on your system, ensuring a consistent development environment.
- **Build Runner:** This tool is required to generate necessary code files for the project.
- **Easy Localization:** Used for managing translations. Ensure the `assets/translations` folder contains your translation files before running the localization command.

For further assistance, refer to the official documentation of **FVM**, **Build Runner**, and **Easy Localization**.

