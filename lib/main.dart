import 'package:flutter/material.dart';
import 'package:turkce_sozluk/feature/home/view/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, title: 'Material App', home: HomeView());
  }
}
