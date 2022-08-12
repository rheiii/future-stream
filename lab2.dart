import 'package:flutter/material.dart';

import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lab 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPressed = false;

  void myCallback() {
    setState(() {
      isPressed = true;
    });
  }

  Stream delayed() async* {
    yield 3;
    await Future.delayed(Duration(seconds: 1));
    yield 2;
    await Future.delayed(Duration(seconds: 1));
    yield 1;
    await Future.delayed(Duration(seconds: 1));
    yield 'Done';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: delayed(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return ElevatedButton(
                  child: Text(isPressed ? snapshot.data.toString() : 'Click'),
                  onPressed: isPressed == false ? myCallback : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
