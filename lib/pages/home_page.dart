import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send Toot with Flutter!"),
      ),
      body: Center(
          child: ElevatedButton.icon(
        icon: const Icon(Icons.send),
        label: const Text("Send Toot!"),
        onPressed: () => {},
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
