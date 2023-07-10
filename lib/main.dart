import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/Screens/screens.dart';
import 'package:pokedex/database/localDatabase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalDataBaseHelper.connect();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
