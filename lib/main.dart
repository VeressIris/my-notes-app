import 'package:flutter_quill/translations.dart';
import 'package:localstorage/localstorage.dart';
import 'package:my_notes_app/pages/homepage.dart';
import 'package:my_notes_app/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'secrets/secrets.dart';

void main() async {
  // debugDefaultTargetPlatformOverride =
  //     TargetPlatform.iOS; // force Cupertino theme onto Quill

  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: Secrets.projectURL, anonKey: Secrets.anonKey);
  await initLocalStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final client = Supabase.instance.client;

    return CupertinoApp(
        title: 'My notes',
        theme: const CupertinoThemeData(
          brightness: Brightness.dark,
          primaryColor: CupertinoColors.systemOrange,
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          FlutterQuillLocalizations
              .delegate, // Add the Quill localization delegate
        ],
        home: client.auth.currentUser == null
            ? const LoginPage()
            : const Homepage(title: 'My notes'));
  }
}
