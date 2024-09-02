import 'package:flutter/material.dart';
import 'package:todoapp/screens/to_do_list_screen.dart';
import 'package:todoapp/screens/to_do_list_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My First App',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
                fontFamily: 'Montserrat'),
            color: Colors.blue,
            shadowColor: Colors.black,
          ),
          brightness: Brightness.dark,
        ),
        home: const ToDoListSplashScreen(),
        routes: {
          '/toDoListScreen': (context) => const ToDoListScreen(),
        });
  }
}
