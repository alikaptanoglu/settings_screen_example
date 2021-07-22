import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:settings_screen_example/page/settings/header_page.dart';
import 'package:settings_screen_example/page/settings_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Settings.init(cacheProvider: SharePreferenceCache());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static final String title = 'Settings';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    /// final isDarkMode = Settings.getValue<bool>(HeaderPage.keyDarkMode, true);

    return ValueChangeObserver<bool>(
      cacheKey: HeaderPage.keyDarkMode,
      defaultValue: true,
      builder: (_, isDarkMode, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: MyApp.title,
        theme: isDarkMode
            ? ThemeData.dark().copyWith(
                primaryColor: Colors.teal,
                accentColor: Colors.white,
                scaffoldBackgroundColor: Color(0xFF170635),
                canvasColor: Color(0xFF170635),
              )
            : ThemeData.light().copyWith(accentColor: Colors.black),
        home: SettingsPage(),
      ),
    );
  }
}
