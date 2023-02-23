import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterdon/pages/settings_page.dart';
import 'package:flutterdon/provider/mastodon_post_provider.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  final TextEditingController _tootController = TextEditingController();

  void _sendToot(BuildContext context, WidgetRef ref) {
    String snackBarStringResult = "";

    if (_tootController.text.isNotEmpty) {
      ref.read(
        postTootProvider(
          tootString: _tootController.text,
        ),
      );
      //TODO: Check if the toot has been sent correctly
      snackBarStringResult = "Toot sent correctly";
    } else {
      snackBarStringResult = "No text entered in toot post";
    }

    //Show SnackBar with the result
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          snackBarStringResult,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              },
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
              onPressed: () => _sendToot(context, ref),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
