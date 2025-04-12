import 'package:flutter/material.dart';

class L10n {
  // List of supported locales
  static final all = [
    const Locale('en'),
    const Locale('fr'),
  ];

  // Optional: Human-readable language name
  static String getLanguageName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'fr':
        return 'Français';
      default:
        return 'English';
    }
  }
}
