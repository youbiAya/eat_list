import 'package:eat_list/category1.dart';
import 'package:eat_list/review.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'opening1.dart';
import 'opening2.dart';
import 'opening3.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('reviewsBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Review(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          Opening1(),
          Opening2(),
          Opening3(),
        ],
      ),
    );
  }
}
