import 'package:flutterdon/provider/mastodon_config_provider.dart';
import 'package:mastodon_api/mastodon_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mastodon_post_provider.g.dart';

@riverpod
Future<bool> postToot(PostTootRef ref, {required String tootString}) async {
  final mastodonConfiguration = await ref.watch(mastodonConfigProvider.future);

  if (mastodonConfiguration.instance == '' ||
      mastodonConfiguration.bearerToken == '') {
    return false;
  } else {
    final mastodon = MastodonApi(
      instance: mastodonConfiguration.instance,
      bearerToken: mastodonConfiguration.bearerToken,

      //! Automatic retry is available when server error or network error occurs
      //! when communicating with the API.
      retryConfig: RetryConfig(
        maxAttempts: 5,
        onExecute: (event) => print(
          'Retry after ${event.intervalInSeconds} seconds... '
          '[${event.retryCount} times]',
        ),
      ),

      //! The default timeout is 10 seconds.
      timeout: const Duration(seconds: 20),
    );

    try {
      //! Let's Toot from v1 endpoint!
      final response = await mastodon.v1.statuses.createStatus(
        text: tootString,
      );

      print(response.rateLimit);
      print(response.data);
      return true;
    } on UnauthorizedException catch (e) {
      print(e);
    } on RateLimitExceededException catch (e) {
      print(e);
    } on MastodonException catch (e) {
      print(e.response);
      print(e.body);
      print(e);
    }

    return false;
  }
}
