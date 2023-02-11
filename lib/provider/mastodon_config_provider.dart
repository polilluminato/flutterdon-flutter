import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// The state of our StateNotifier should be immutable.
@immutable
class MastodonConfig {
  const MastodonConfig({required this.instance, required this.bearerToken});

  // All properties should be `final` on our class.
  final String instance;
  final String bearerToken;

  // Since Todo is immutable, we implement a method that allows cloning the
  // Todo with slightly different content.
  MastodonConfig copyWith({String? instance, String? bearerToken}) {
    return MastodonConfig(
      instance: instance ?? this.instance,
      bearerToken: bearerToken ?? this.bearerToken,
    );
  }
}

class MastodonConfigNotifier extends StateNotifier<MastodonConfig> {
  MastodonConfigNotifier()
      : super(const MastodonConfig(instance: "", bearerToken: ""));

  void updateConfig(MastodonConfig mastodonConfig) {
    state = mastodonConfig;
  }
}

// Finally, we are using StateNotifierProvider to allow the UI to interact with
// our MastodonConfigNotifier class.
final mastodonConfigProvider =
    StateNotifierProvider<MastodonConfigNotifier, MastodonConfig>((_) {
  return MastodonConfigNotifier();
});
