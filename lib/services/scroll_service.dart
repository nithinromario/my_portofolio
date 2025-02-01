import 'package:flutter/material.dart';

class ScrollService {
  static final ScrollController scrollController = ScrollController();
  static final Map<String, GlobalKey> sectionKeys = {
    'home': GlobalKey(),
    'bio': GlobalKey(),
    'skills': GlobalKey(),
    'experience': GlobalKey(),
    'projects': GlobalKey(),
    'education': GlobalKey(),
  };

  static void scrollToSection(String section) {
    final key = sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }
} 