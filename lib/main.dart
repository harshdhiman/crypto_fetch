import 'package:crypto_fetch/constants.dart';
import 'package:crypto_fetch/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
          colorScheme: const ColorScheme.dark(
        primary: kAppColor,
      )).copyWith(
        appBarTheme: const AppBarTheme(
          color: kAppBackgroundColor2,
          elevation: 0,
          centerTitle: true,
        ),
        scaffoldBackgroundColor: kAppBackgroundColor,
      ),
      home: const HomePage(),
    );
  }
}
