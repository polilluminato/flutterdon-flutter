import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);
  final TextEditingController _mastodonInstanceController =
      TextEditingController();
  final TextEditingController _bearerTokenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _mastodonInstanceController,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mastodon Instance',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _bearerTokenController,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Bearer Token',
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () => {},
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
