import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/basket_view.dart';
import 'package:southsea_cinema/views/settings_view.dart';

bool isSupportedPlatform() {
  if (kIsWeb) {
    return false;
  }
  if (defaultTargetPlatform == TargetPlatform.android) {
    return true;
  }
  return false;
}

void main() {
  if (isSupportedPlatform()) {
    runApp(const SouthseaCinemaApp());
  } else {
    runApp(const UnsupportedPlatformApp());
  }
}

class SouthseaCinemaApp extends StatefulWidget {
  const SouthseaCinemaApp({super.key});

  @override
  State<SouthseaCinemaApp> createState() => _SouthseaCinemaAppState();
}

class _SouthseaCinemaAppState extends State<SouthseaCinemaApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _updateThemeMode(ThemeMode themeMode) {
    if (_themeMode != themeMode) {
      setState(() {
        _themeMode = themeMode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme darkColorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: cinemaBrand,
      primary: cinemaBrand,
      onPrimary: Colors.white,
      surface: cinemaSurface,
      onSurfaceVariant: Colors.grey,
      outlineVariant: Colors.white24,
    );
    final ColorScheme lightColorScheme = ColorScheme.fromSeed(
      seedColor: cinemaBrand,
      surface: Colors.white,
    );
    final ThemeData darkTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: cinemaBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: cinemaSurface,
        iconTheme: IconThemeData(color: darkColorScheme.primary),
        titleTextStyle:
            cinemaHeaderStyle.copyWith(color: darkColorScheme.onSurface),
        elevation: 0,
      ),
      colorScheme: darkColorScheme,
    );
    final ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color(0xFFF5F6F8),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: lightColorScheme.primary),
        titleTextStyle:
            cinemaHeaderStyle.copyWith(color: lightColorScheme.onSurface),
        elevation: 0,
      ),
      colorScheme: lightColorScheme,
    );

    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          return HomeView(
            themeMode: _themeMode,
            onThemeModeChanged: _updateThemeMode,
          );
        },
        '/basket': (BuildContext context) {
          return const BasketScreen();
        },
        '/settings': (BuildContext context) {
          return SettingsScreen(
            themeMode: _themeMode,
            onThemeModeChanged: _updateThemeMode,
          );
        },
      },
    );
  }
}

class UnsupportedPlatformApp extends StatelessWidget {
  const UnsupportedPlatformApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'This app saves orders with SQLite and is set up to run on '
              'Android only. Stop the app and run it on an Android emulator '
              'or device instead.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
