import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StateManagementApp(title: 'Random Color App', color: Colors.indigo),
    );
  }
}

class StateManagementApp extends StatefulWidget {
  StateManagementApp({Key? key, required this.title, required this.color}) : super(key: key);

  final String title;
  Color color;

  @override
  State<StateManagementApp> createState() => _StateManagementAppState();
}

class _StateManagementAppState extends State<StateManagementApp> {

  int _red = 0;
  int _green = 0;
  int _blue = 0;

  void _changeColor() {
    _red = Random.secure().nextInt(266);
    _green = Random.secure().nextInt(266);
    _blue = Random.secure().nextInt(266);
    setState(() {
      widget.color = Color.fromRGBO(_red, _green, _blue, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This color displayed is :'),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.13,
              color: widget.color,
              child: Center(
                child: Text(
                  'R(${widget.color.red}), G(${widget.color.green}), B(${widget.color.blue})',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Change color',
        backgroundColor: widget.color,
        child: const Icon(Icons.palette),
        onPressed: _changeColor,

      ),
    );
  }
}
