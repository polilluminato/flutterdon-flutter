// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterdon/provider/mastodon_config_provider.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends ConsumerWidget {
  SettingsPage({Key? key}) : super(key: key);
  final TextEditingController _mastodonInstanceController =
      TextEditingController();
  final TextEditingController _bearerTokenController = TextEditingController();

  void _saveMastodonConfig(BuildContext context, WidgetRef ref) {
    String snackBarStringResult = "";

    if (_mastodonInstanceController.text.isNotEmpty &&
        _bearerTokenController.text.isNotEmpty) {
      //TODO: Put some sort of validation
      String instance = _mastodonInstanceController.text;
      String bearerToken = _bearerTokenController.text;

      ref.read(mastodonConfigProvider.notifier).updateConfig(
            MastodonConfig(instance: instance, bearerToken: bearerToken),
          );

      snackBarStringResult = "Information updated successfully";
    } else {
      snackBarStringResult =
          "Not all the necessary information has been entered";
    }

    //Show SnackBar with the result
    SnackBar snackBar = SnackBar(content: Text(snackBarStringResult));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MastodonConfig mastodonConfig = ref.watch(mastodonConfigProvider);

    _mastodonInstanceController.text = mastodonConfig.instance;
    _bearerTokenController.text = mastodonConfig.bearerToken;

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
              onPressed: () => _saveMastodonConfig(context, ref),
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
