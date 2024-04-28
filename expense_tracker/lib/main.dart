import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 245, 123, 231));

var kDarkColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 4, 26, 32));

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   // DeviceOrientation.portraitDown,
  // ]).then((value) {
    runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        // useMaterial3: true,
         appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.onPrimaryContainer,
          foregroundColor: kDarkColorScheme.primaryContainer,
        ),
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        // scaffoldBackgroundColor:const Color.fromARGB(255, 220, 189, 252)
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
      ),
      themeMode: ThemeMode.light, // default is ThemeMode.system
      home: const Expenses(),
    ),
  );
  // }
  // );
  
}
