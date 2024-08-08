import 'package:flutter_quill/translations.dart';
import 'package:my_notes_app/pages/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/foundation.dart';

void main() {
  debugDefaultTargetPlatformOverride =
      TargetPlatform.iOS; // force Cupertino theme onto Quill

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'My notes',
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: CupertinoColors.systemOrange,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FlutterQuillLocalizations
            .delegate, // Add the Quill localization delegate
      ],
      home: Homepage(title: 'My notes'),
    );
  }
}
