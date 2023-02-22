// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_post_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postTootHash() => r'adee401f375c6f7fc205408a6e3e9e1f19022b4a';

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

typedef PostTootRef = AutoDisposeFutureProviderRef<bool>;

/// See also [postToot].
@ProviderFor(postToot)
const postTootProvider = PostTootFamily();

/// See also [postToot].
class PostTootFamily extends Family<AsyncValue<bool>> {
  /// See also [postToot].
  const PostTootFamily();

  /// See also [postToot].
  PostTootProvider call({
    required String tootString,
  }) {
    return PostTootProvider(
      tootString: tootString,
    );
  }

  @override
  PostTootProvider getProviderOverride(
    covariant PostTootProvider provider,
  ) {
    return call(
      tootString: provider.tootString,
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
  String? get name => r'postTootProvider';
}

/// See also [postToot].
class PostTootProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [postToot].
  PostTootProvider({
    required this.tootString,
  }) : super.internal(
          (ref) => postToot(
            ref,
            tootString: tootString,
          ),
          from: postTootProvider,
          name: r'postTootProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postTootHash,
          dependencies: PostTootFamily._dependencies,
          allTransitiveDependencies: PostTootFamily._allTransitiveDependencies,
        );

  final String tootString;

  @override
  bool operator ==(Object other) {
    return other is PostTootProvider && other.tootString == tootString;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tootString.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
