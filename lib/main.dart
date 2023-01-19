import 'package:api_bloc/repos/repository.dart';
import 'package:api_bloc/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Flutter Bloc Demo',
      home: RepositoryProvider(
        create: (context)=>UserRepo(),
        child: const HomeScreen(),
      ),
    );
  }
}
