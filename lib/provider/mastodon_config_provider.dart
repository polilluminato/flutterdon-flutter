import 'package:flutterdon/models/mastodon_config.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mastodon_config_provider.g.dart';

@riverpod
Future<MastodonConfig> mastodonConfig(MastodonConfigRef ref) async {
  var mastodonConfigBox = await Hive.openBox('mastodonConfigBox');
  String instance = mastodonConfigBox.get('instance', defaultValue: '');
  String bearerToken = mastodonConfigBox.get('bearerToken', defaultValue: '');
  return MastodonConfig(instance: instance, bearerToken: bearerToken);
}

@riverpod
Future<bool> updateMastodonConfig(
  UpdateMastodonConfigRef ref, {
  required String instance,
  required String bearerToken,
}) async {
  var mastodonConfigBox = await Hive.openBox('mastodonConfigBox');
  mastodonConfigBox.put('instance', instance);
  mastodonConfigBox.put('bearerToken', bearerToken);
  return true;
}
