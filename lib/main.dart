import 'package:flutter/material.dart';
import 'package:movielisting/providers/movies_provider.dart';
import 'package:movielisting/providers/users_provider.dart';
import 'package:movielisting/screens.dart/home_screen.dart';
import 'package:movielisting/screens.dart/login_screen.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MoviesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: LoginScreen(),
        // home: HomeScreen(),
      ),
    );
  }
}
