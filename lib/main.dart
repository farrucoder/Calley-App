import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermachinetest/Pages/AuthPages/Sign-In-Page.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Force show status + navigation bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.top,
    SystemUiOverlay.bottom,
  ]);

  // ✅ Style status bar icons and color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // or any light color
      statusBarIconBrightness: Brightness.dark, // so icons are visible
      systemNavigationBarColor: Colors.white, // for bottom nav bar
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Signinpage(),
    );
  }
}
