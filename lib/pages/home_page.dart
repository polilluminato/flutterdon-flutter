import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Send Toot with Flutter!"),
        leading: IconButton(
          iconSize: 24,
          icon: const Icon(Icons.settings_outlined),
          onPressed: () => context.push('/settings'),
        ),
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
