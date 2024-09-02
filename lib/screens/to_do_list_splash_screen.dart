import 'dart:async';

import 'package:flutter/material.dart';

class ToDoListSplashScreen extends StatefulWidget {
  const ToDoListSplashScreen({super.key});

  @override
  State<ToDoListSplashScreen> createState() => _ToDoListSplashScreenState();
}

class _ToDoListSplashScreenState extends State<ToDoListSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/toDoListScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Color.fromARGB(255, 99, 185, 255)])),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 273,
                ),
                SizedBox.square(
                    dimension: 180,
                    child: Image.asset('assets/images/todoappicon.png')),
                const SizedBox(
                  height: 10,
                ),
                const Text("TO DO APP",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      // shadows: [
                      //   Shadow(color: Colors.white, offset: Offset(0, 2))
                      // ],
                    )),
                const SizedBox(
                  height: 200,
                ),
                const Text("Developed By:",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                const Text("suheerthedev",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
