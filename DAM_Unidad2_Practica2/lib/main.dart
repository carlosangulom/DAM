import 'package:flutter/material.dart';
import 'package:untitled/theme.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'themeprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, ThemeProvider notifier, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Login',
              theme: TAppTheme.lightTheme,
              darkTheme: TAppTheme.darkTheme,
              themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
              home: const Home(),
            );
          },
        ));
  }
}





