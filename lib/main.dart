import 'package:flutter/material.dart';
import 'package:my_portofolio/screens/home_screen.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy()); // For cleaner URLs in web
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nithin A - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        // Dark background with a slight blue tint
        scaffoldBackgroundColor: const Color(0xFF1A1B26),
        
        // Card color with slight transparency
        cardColor: const Color(0xFF24283B),
        
        // Primary and accent colors from app icons
        primaryColor: const Color(0xFF7AA2F7), // Bright blue
        colorScheme: const ColorScheme.dark().copyWith(
          primary: const Color(0xFF7AA2F7),    // Bright blue
          secondary: const Color(0xFF9ECE6A),   // Soft green
          tertiary: const Color(0xFFBB9AF7),    // Purple accent
          surface: const Color(0xFF24283B),     // Card surface
          background: const Color(0xFF1A1B26),  // Background
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: const Color(0xFFA9B1D6),   // Text on surface
          onBackground: const Color(0xFFA9B1D6), // Text on background
        ),
        
        // Text theme
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: Color(0xFF7AA2F7),
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
          bodyLarge: TextStyle(
            color: Color(0xFFA9B1D6),
            fontSize: 18,
          ),
          bodyMedium: TextStyle(
            color: Color(0xFFA9B1D6),
            fontSize: 16,
          ),
        ),
        
        // Card theme
        cardTheme: CardTheme(
          color: const Color(0xFF24283B),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: const Color(0xFF7AA2F7).withOpacity(0.1),
              width: 1,
            ),
          ),
        ),
        
        // Icon theme
        iconTheme: const IconThemeData(
          color: Color(0xFF7AA2F7),
          size: 24,
        ),
        
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      home: const ResponsiveLayout(
        child: HomeScreen(),
      ),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            scrollbars: false,
            physics: const BouncingScrollPhysics(),
          ),
          child: child!,
        );
      },
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  final Widget child;

  const ResponsiveLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return child;
      },
    );
  }
}
