import 'package:flutter/material.dart';
import 'package:portfolio/styles/style.dart';
import 'package:portfolio/views/MainContainer.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ines Ciattoni - Portfolio",
      localizationsDelegates: [
        FlutterI18nDelegate(
            translationLoader: FileTranslationLoader(
                fallbackFile: 'en', basePath: 'assets/lang')),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
        Locale('fr', '')
      ],
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      routes: {
        '/': (context) => const MainContainer('Home'),
        '/Works': (context) => const MainContainer('Works'),
        '/About': (context) => const MainContainer('About'),
        '/Project': (context) => const MainContainer('Project'),
      },
    );
  }
}
