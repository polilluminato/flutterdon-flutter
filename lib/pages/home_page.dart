import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController _tootController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Send Toot with Flutter!"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              iconSize: 24,
              icon: const Icon(Icons.settings_outlined),
              onPressed: () => context.push('/settings'),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _tootController,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text("Send Toot!"),
              onPressed: () => {},
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
