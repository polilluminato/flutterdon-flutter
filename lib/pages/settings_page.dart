// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterdon/models/mastodon_config.dart';
import 'package:flutterdon/provider/mastodon_config_provider.dart';
import 'package:flutterdon/utils/nil.dart';

class SettingsPage extends ConsumerWidget {
  SettingsPage({Key? key}) : super(key: key);
  final TextEditingController _instanceController = TextEditingController();
  final TextEditingController _bearerTokenController = TextEditingController();

  void _saveMastodonConfig(BuildContext context, WidgetRef ref) {
    String snackBarStringResult = "";

    if (_instanceController.text.isNotEmpty &&
        _bearerTokenController.text.isNotEmpty) {
      //TODO: Put some sort of validation

      ref.read(UpdateMastodonConfigProvider(
        instance: _instanceController.text,
        bearerToken: _bearerTokenController.text,
      ));

      snackBarStringResult = "Information updated successfully";
    } else {
      snackBarStringResult =
          "Not all the necessary information has been entered";
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
    AsyncValue<MastodonConfig> mastodonConfig =
        ref.watch(mastodonConfigProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: mastodonConfig.when(
                loading: () => nil,
                error: (err, stack) => Text('Error: $err'),
                data: (mastodonConfig) {
                  _instanceController.text = mastodonConfig.instance;
                  return TextFormField(
                    controller: _instanceController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mastodon Instance',
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: mastodonConfig.when(
                loading: () => nil,
                error: (err, stack) => Text('Error: $err'),
                data: (mastodonConfig) {
                  _bearerTokenController.text = mastodonConfig.bearerToken;
                  return TextFormField(
                    controller: _bearerTokenController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mastodon Instance',
                    ),
                  );
                },
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
