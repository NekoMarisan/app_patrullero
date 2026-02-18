import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/detalle_screen.dart';

void main() {
  runApp(const AppPatrullero());
}

class AppPatrullero extends StatelessWidget {
  const AppPatrullero({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Patrullero',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0B5E2E), // Verde institucional
        ),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/detalle': (context) => const DetalleScreen(),
      },
    );
  }
}
