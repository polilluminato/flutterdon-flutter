// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_config_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mastodonConfigHash() => r'e65690cd33dc0ca0e45c585da0f8233fe9010f68';

/// See also [mastodonConfig].
@ProviderFor(mastodonConfig)
final mastodonConfigProvider =
    AutoDisposeFutureProvider<MastodonConfig>.internal(
  mastodonConfig,
  name: r'mastodonConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mastodonConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MastodonConfigRef = AutoDisposeFutureProviderRef<MastodonConfig>;
String _$updateMastodonConfigHash() =>
    r'31a53e173fa38fe7b868aa086d0948e8ea488c9a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef UpdateMastodonConfigRef = AutoDisposeFutureProviderRef<bool>;

/// See also [updateMastodonConfig].
@ProviderFor(updateMastodonConfig)
const updateMastodonConfigProvider = UpdateMastodonConfigFamily();

/// See also [updateMastodonConfig].
class UpdateMastodonConfigFamily extends Family<AsyncValue<bool>> {
  /// See also [updateMastodonConfig].
  const UpdateMastodonConfigFamily();

  /// See also [updateMastodonConfig].
  UpdateMastodonConfigProvider call({
    required String instance,
    required String bearerToken,
  }) {
    return UpdateMastodonConfigProvider(
      instance: instance,
      bearerToken: bearerToken,
    );
  }

  @override
  UpdateMastodonConfigProvider getProviderOverride(
    covariant UpdateMastodonConfigProvider provider,
  ) {
    return call(
      instance: provider.instance,
      bearerToken: provider.bearerToken,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateMastodonConfigProvider';
}

/// See also [updateMastodonConfig].
class UpdateMastodonConfigProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [updateMastodonConfig].
  UpdateMastodonConfigProvider({
    required this.instance,
    required this.bearerToken,
  }) : super.internal(
          (ref) => updateMastodonConfig(
            ref,
            instance: instance,
            bearerToken: bearerToken,
          ),
          from: updateMastodonConfigProvider,
          name: r'updateMastodonConfigProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateMastodonConfigHash,
          dependencies: UpdateMastodonConfigFamily._dependencies,
          allTransitiveDependencies:
              UpdateMastodonConfigFamily._allTransitiveDependencies,
        );

  final String instance;
  final String bearerToken;

  @override
  bool operator ==(Object other) {
    return other is UpdateMastodonConfigProvider &&
        other.instance == instance &&
        other.bearerToken == bearerToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, instance.hashCode);
    hash = _SystemHash.combine(hash, bearerToken.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
