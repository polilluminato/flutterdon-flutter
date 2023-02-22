import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterdon/provider/mastodon_post_provider.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  final TextEditingController _tootController = TextEditingController();
  late final WidgetRef _ref;

  void _sendToot() {
    if (_tootController.text.isNotEmpty) {
      _ref.read(postTootProvider(tootString: _tootController.text));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

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
              onPressed: () => _sendToot(),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
