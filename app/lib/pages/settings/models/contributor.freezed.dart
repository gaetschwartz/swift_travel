// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'contributor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Contributor _$ContributorFromJson(Map<String, dynamic> json) {
  return _Contributor.fromJson(json);
}

/// @nodoc
class _$ContributorTearOff {
  const _$ContributorTearOff();

  _Contributor call(
      {required String login,
      required int id,
      @JsonKey(name: 'node_id') required String nodeId,
      @JsonKey(name: 'avatar_url') required String avatarUrl,
      @JsonKey(name: 'gravatar_id') required String gravatarId,
      required String url,
      @JsonKey(name: 'html_url') required String htmlUrl,
      @JsonKey(name: 'followers_url') required String followersUrl,
      @JsonKey(name: 'following_url') required String followingUrl,
      @JsonKey(name: 'gists_url') required String gistsUrl,
      @JsonKey(name: 'starred_url') required String starredUrl,
      @JsonKey(name: 'subscriptions_url') required String subscriptionsUrl,
      @JsonKey(name: 'organizations_url') required String organizationsUrl,
      @JsonKey(name: 'repos_url') required String reposUrl,
      @JsonKey(name: 'events_url') required String eventsUrl,
      @JsonKey(name: 'received_events_url') required String receivedEventsUrl,
      required String type,
      @JsonKey(name: 'site_admin') required bool siteAdmin,
      required int contributions}) {
    return _Contributor(
      login: login,
      id: id,
      nodeId: nodeId,
      avatarUrl: avatarUrl,
      gravatarId: gravatarId,
      url: url,
      htmlUrl: htmlUrl,
      followersUrl: followersUrl,
      followingUrl: followingUrl,
      gistsUrl: gistsUrl,
      starredUrl: starredUrl,
      subscriptionsUrl: subscriptionsUrl,
      organizationsUrl: organizationsUrl,
      reposUrl: reposUrl,
      eventsUrl: eventsUrl,
      receivedEventsUrl: receivedEventsUrl,
      type: type,
      siteAdmin: siteAdmin,
      contributions: contributions,
    );
  }

  Contributor fromJson(Map<String, Object> json) {
    return Contributor.fromJson(json);
  }
}

/// @nodoc
const $Contributor = _$ContributorTearOff();

/// @nodoc
mixin _$Contributor {
  String get login => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'node_id')
  String get nodeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'gravatar_id')
  String get gravatarId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String get htmlUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_url')
  String get followersUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'following_url')
  String get followingUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'gists_url')
  String get gistsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'starred_url')
  String get starredUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscriptions_url')
  String get subscriptionsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'organizations_url')
  String get organizationsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'repos_url')
  String get reposUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'events_url')
  String get eventsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'received_events_url')
  String get receivedEventsUrl => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_admin')
  bool get siteAdmin => throw _privateConstructorUsedError;
  int get contributions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContributorCopyWith<Contributor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContributorCopyWith<$Res> {
  factory $ContributorCopyWith(
          Contributor value, $Res Function(Contributor) then) =
      _$ContributorCopyWithImpl<$Res>;
  $Res call(
      {String login,
      int id,
      @JsonKey(name: 'node_id') String nodeId,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      @JsonKey(name: 'gravatar_id') String gravatarId,
      String url,
      @JsonKey(name: 'html_url') String htmlUrl,
      @JsonKey(name: 'followers_url') String followersUrl,
      @JsonKey(name: 'following_url') String followingUrl,
      @JsonKey(name: 'gists_url') String gistsUrl,
      @JsonKey(name: 'starred_url') String starredUrl,
      @JsonKey(name: 'subscriptions_url') String subscriptionsUrl,
      @JsonKey(name: 'organizations_url') String organizationsUrl,
      @JsonKey(name: 'repos_url') String reposUrl,
      @JsonKey(name: 'events_url') String eventsUrl,
      @JsonKey(name: 'received_events_url') String receivedEventsUrl,
      String type,
      @JsonKey(name: 'site_admin') bool siteAdmin,
      int contributions});
}

/// @nodoc
class _$ContributorCopyWithImpl<$Res> implements $ContributorCopyWith<$Res> {
  _$ContributorCopyWithImpl(this._value, this._then);

  final Contributor _value;
  // ignore: unused_field
  final $Res Function(Contributor) _then;

  @override
  $Res call({
    Object? login = freezed,
    Object? id = freezed,
    Object? nodeId = freezed,
    Object? avatarUrl = freezed,
    Object? gravatarId = freezed,
    Object? url = freezed,
    Object? htmlUrl = freezed,
    Object? followersUrl = freezed,
    Object? followingUrl = freezed,
    Object? gistsUrl = freezed,
    Object? starredUrl = freezed,
    Object? subscriptionsUrl = freezed,
    Object? organizationsUrl = freezed,
    Object? reposUrl = freezed,
    Object? eventsUrl = freezed,
    Object? receivedEventsUrl = freezed,
    Object? type = freezed,
    Object? siteAdmin = freezed,
    Object? contributions = freezed,
  }) {
    return _then(_value.copyWith(
      login: login == freezed
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nodeId: nodeId == freezed
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: avatarUrl == freezed
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gravatarId: gravatarId == freezed
          ? _value.gravatarId
          : gravatarId // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      htmlUrl: htmlUrl == freezed
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      followersUrl: followersUrl == freezed
          ? _value.followersUrl
          : followersUrl // ignore: cast_nullable_to_non_nullable
              as String,
      followingUrl: followingUrl == freezed
          ? _value.followingUrl
          : followingUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gistsUrl: gistsUrl == freezed
          ? _value.gistsUrl
          : gistsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      starredUrl: starredUrl == freezed
          ? _value.starredUrl
          : starredUrl // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionsUrl: subscriptionsUrl == freezed
          ? _value.subscriptionsUrl
          : subscriptionsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      organizationsUrl: organizationsUrl == freezed
          ? _value.organizationsUrl
          : organizationsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      reposUrl: reposUrl == freezed
          ? _value.reposUrl
          : reposUrl // ignore: cast_nullable_to_non_nullable
              as String,
      eventsUrl: eventsUrl == freezed
          ? _value.eventsUrl
          : eventsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      receivedEventsUrl: receivedEventsUrl == freezed
          ? _value.receivedEventsUrl
          : receivedEventsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      siteAdmin: siteAdmin == freezed
          ? _value.siteAdmin
          : siteAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      contributions: contributions == freezed
          ? _value.contributions
          : contributions // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ContributorCopyWith<$Res>
    implements $ContributorCopyWith<$Res> {
  factory _$ContributorCopyWith(
          _Contributor value, $Res Function(_Contributor) then) =
      __$ContributorCopyWithImpl<$Res>;
  @override
  $Res call(
      {String login,
      int id,
      @JsonKey(name: 'node_id') String nodeId,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      @JsonKey(name: 'gravatar_id') String gravatarId,
      String url,
      @JsonKey(name: 'html_url') String htmlUrl,
      @JsonKey(name: 'followers_url') String followersUrl,
      @JsonKey(name: 'following_url') String followingUrl,
      @JsonKey(name: 'gists_url') String gistsUrl,
      @JsonKey(name: 'starred_url') String starredUrl,
      @JsonKey(name: 'subscriptions_url') String subscriptionsUrl,
      @JsonKey(name: 'organizations_url') String organizationsUrl,
      @JsonKey(name: 'repos_url') String reposUrl,
      @JsonKey(name: 'events_url') String eventsUrl,
      @JsonKey(name: 'received_events_url') String receivedEventsUrl,
      String type,
      @JsonKey(name: 'site_admin') bool siteAdmin,
      int contributions});
}

/// @nodoc
class __$ContributorCopyWithImpl<$Res> extends _$ContributorCopyWithImpl<$Res>
    implements _$ContributorCopyWith<$Res> {
  __$ContributorCopyWithImpl(
      _Contributor _value, $Res Function(_Contributor) _then)
      : super(_value, (v) => _then(v as _Contributor));

  @override
  _Contributor get _value => super._value as _Contributor;

  @override
  $Res call({
    Object? login = freezed,
    Object? id = freezed,
    Object? nodeId = freezed,
    Object? avatarUrl = freezed,
    Object? gravatarId = freezed,
    Object? url = freezed,
    Object? htmlUrl = freezed,
    Object? followersUrl = freezed,
    Object? followingUrl = freezed,
    Object? gistsUrl = freezed,
    Object? starredUrl = freezed,
    Object? subscriptionsUrl = freezed,
    Object? organizationsUrl = freezed,
    Object? reposUrl = freezed,
    Object? eventsUrl = freezed,
    Object? receivedEventsUrl = freezed,
    Object? type = freezed,
    Object? siteAdmin = freezed,
    Object? contributions = freezed,
  }) {
    return _then(_Contributor(
      login: login == freezed
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nodeId: nodeId == freezed
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: avatarUrl == freezed
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gravatarId: gravatarId == freezed
          ? _value.gravatarId
          : gravatarId // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      htmlUrl: htmlUrl == freezed
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      followersUrl: followersUrl == freezed
          ? _value.followersUrl
          : followersUrl // ignore: cast_nullable_to_non_nullable
              as String,
      followingUrl: followingUrl == freezed
          ? _value.followingUrl
          : followingUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gistsUrl: gistsUrl == freezed
          ? _value.gistsUrl
          : gistsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      starredUrl: starredUrl == freezed
          ? _value.starredUrl
          : starredUrl // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionsUrl: subscriptionsUrl == freezed
          ? _value.subscriptionsUrl
          : subscriptionsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      organizationsUrl: organizationsUrl == freezed
          ? _value.organizationsUrl
          : organizationsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      reposUrl: reposUrl == freezed
          ? _value.reposUrl
          : reposUrl // ignore: cast_nullable_to_non_nullable
              as String,
      eventsUrl: eventsUrl == freezed
          ? _value.eventsUrl
          : eventsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      receivedEventsUrl: receivedEventsUrl == freezed
          ? _value.receivedEventsUrl
          : receivedEventsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      siteAdmin: siteAdmin == freezed
          ? _value.siteAdmin
          : siteAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      contributions: contributions == freezed
          ? _value.contributions
          : contributions // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Contributor implements _Contributor {
  const _$_Contributor(
      {required this.login,
      required this.id,
      @JsonKey(name: 'node_id') required this.nodeId,
      @JsonKey(name: 'avatar_url') required this.avatarUrl,
      @JsonKey(name: 'gravatar_id') required this.gravatarId,
      required this.url,
      @JsonKey(name: 'html_url') required this.htmlUrl,
      @JsonKey(name: 'followers_url') required this.followersUrl,
      @JsonKey(name: 'following_url') required this.followingUrl,
      @JsonKey(name: 'gists_url') required this.gistsUrl,
      @JsonKey(name: 'starred_url') required this.starredUrl,
      @JsonKey(name: 'subscriptions_url') required this.subscriptionsUrl,
      @JsonKey(name: 'organizations_url') required this.organizationsUrl,
      @JsonKey(name: 'repos_url') required this.reposUrl,
      @JsonKey(name: 'events_url') required this.eventsUrl,
      @JsonKey(name: 'received_events_url') required this.receivedEventsUrl,
      required this.type,
      @JsonKey(name: 'site_admin') required this.siteAdmin,
      required this.contributions});

  factory _$_Contributor.fromJson(Map<String, dynamic> json) =>
      _$_$_ContributorFromJson(json);

  @override
  final String login;
  @override
  final int id;
  @override
  @JsonKey(name: 'node_id')
  final String nodeId;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @override
  @JsonKey(name: 'gravatar_id')
  final String gravatarId;
  @override
  final String url;
  @override
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  @override
  @JsonKey(name: 'followers_url')
  final String followersUrl;
  @override
  @JsonKey(name: 'following_url')
  final String followingUrl;
  @override
  @JsonKey(name: 'gists_url')
  final String gistsUrl;
  @override
  @JsonKey(name: 'starred_url')
  final String starredUrl;
  @override
  @JsonKey(name: 'subscriptions_url')
  final String subscriptionsUrl;
  @override
  @JsonKey(name: 'organizations_url')
  final String organizationsUrl;
  @override
  @JsonKey(name: 'repos_url')
  final String reposUrl;
  @override
  @JsonKey(name: 'events_url')
  final String eventsUrl;
  @override
  @JsonKey(name: 'received_events_url')
  final String receivedEventsUrl;
  @override
  final String type;
  @override
  @JsonKey(name: 'site_admin')
  final bool siteAdmin;
  @override
  final int contributions;

  @override
  String toString() {
    return 'Contributor(login: $login, id: $id, nodeId: $nodeId, avatarUrl: $avatarUrl, gravatarId: $gravatarId, url: $url, htmlUrl: $htmlUrl, followersUrl: $followersUrl, followingUrl: $followingUrl, gistsUrl: $gistsUrl, starredUrl: $starredUrl, subscriptionsUrl: $subscriptionsUrl, organizationsUrl: $organizationsUrl, reposUrl: $reposUrl, eventsUrl: $eventsUrl, receivedEventsUrl: $receivedEventsUrl, type: $type, siteAdmin: $siteAdmin, contributions: $contributions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Contributor &&
            (identical(other.login, login) ||
                const DeepCollectionEquality().equals(other.login, login)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.nodeId, nodeId) ||
                const DeepCollectionEquality().equals(other.nodeId, nodeId)) &&
            (identical(other.avatarUrl, avatarUrl) ||
                const DeepCollectionEquality()
                    .equals(other.avatarUrl, avatarUrl)) &&
            (identical(other.gravatarId, gravatarId) ||
                const DeepCollectionEquality()
                    .equals(other.gravatarId, gravatarId)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.htmlUrl, htmlUrl) ||
                const DeepCollectionEquality()
                    .equals(other.htmlUrl, htmlUrl)) &&
            (identical(other.followersUrl, followersUrl) ||
                const DeepCollectionEquality()
                    .equals(other.followersUrl, followersUrl)) &&
            (identical(other.followingUrl, followingUrl) ||
                const DeepCollectionEquality()
                    .equals(other.followingUrl, followingUrl)) &&
            (identical(other.gistsUrl, gistsUrl) ||
                const DeepCollectionEquality()
                    .equals(other.gistsUrl, gistsUrl)) &&
            (identical(other.starredUrl, starredUrl) ||
                const DeepCollectionEquality()
                    .equals(other.starredUrl, starredUrl)) &&
            (identical(other.subscriptionsUrl, subscriptionsUrl) ||
                const DeepCollectionEquality()
                    .equals(other.subscriptionsUrl, subscriptionsUrl)) &&
            (identical(other.organizationsUrl, organizationsUrl) ||
                const DeepCollectionEquality()
                    .equals(other.organizationsUrl, organizationsUrl)) &&
            (identical(other.reposUrl, reposUrl) ||
                const DeepCollectionEquality()
                    .equals(other.reposUrl, reposUrl)) &&
            (identical(other.eventsUrl, eventsUrl) ||
                const DeepCollectionEquality()
                    .equals(other.eventsUrl, eventsUrl)) &&
            (identical(other.receivedEventsUrl, receivedEventsUrl) ||
                const DeepCollectionEquality()
                    .equals(other.receivedEventsUrl, receivedEventsUrl)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.siteAdmin, siteAdmin) ||
                const DeepCollectionEquality()
                    .equals(other.siteAdmin, siteAdmin)) &&
            (identical(other.contributions, contributions) ||
                const DeepCollectionEquality()
                    .equals(other.contributions, contributions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(login) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(nodeId) ^
      const DeepCollectionEquality().hash(avatarUrl) ^
      const DeepCollectionEquality().hash(gravatarId) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(htmlUrl) ^
      const DeepCollectionEquality().hash(followersUrl) ^
      const DeepCollectionEquality().hash(followingUrl) ^
      const DeepCollectionEquality().hash(gistsUrl) ^
      const DeepCollectionEquality().hash(starredUrl) ^
      const DeepCollectionEquality().hash(subscriptionsUrl) ^
      const DeepCollectionEquality().hash(organizationsUrl) ^
      const DeepCollectionEquality().hash(reposUrl) ^
      const DeepCollectionEquality().hash(eventsUrl) ^
      const DeepCollectionEquality().hash(receivedEventsUrl) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(siteAdmin) ^
      const DeepCollectionEquality().hash(contributions);

  @JsonKey(ignore: true)
  @override
  _$ContributorCopyWith<_Contributor> get copyWith =>
      __$ContributorCopyWithImpl<_Contributor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContributorToJson(this);
  }
}

abstract class _Contributor implements Contributor {
  const factory _Contributor(
      {required String login,
      required int id,
      @JsonKey(name: 'node_id') required String nodeId,
      @JsonKey(name: 'avatar_url') required String avatarUrl,
      @JsonKey(name: 'gravatar_id') required String gravatarId,
      required String url,
      @JsonKey(name: 'html_url') required String htmlUrl,
      @JsonKey(name: 'followers_url') required String followersUrl,
      @JsonKey(name: 'following_url') required String followingUrl,
      @JsonKey(name: 'gists_url') required String gistsUrl,
      @JsonKey(name: 'starred_url') required String starredUrl,
      @JsonKey(name: 'subscriptions_url') required String subscriptionsUrl,
      @JsonKey(name: 'organizations_url') required String organizationsUrl,
      @JsonKey(name: 'repos_url') required String reposUrl,
      @JsonKey(name: 'events_url') required String eventsUrl,
      @JsonKey(name: 'received_events_url') required String receivedEventsUrl,
      required String type,
      @JsonKey(name: 'site_admin') required bool siteAdmin,
      required int contributions}) = _$_Contributor;

  factory _Contributor.fromJson(Map<String, dynamic> json) =
      _$_Contributor.fromJson;

  @override
  String get login => throw _privateConstructorUsedError;
  @override
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'node_id')
  String get nodeId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'gravatar_id')
  String get gravatarId => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'html_url')
  String get htmlUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'followers_url')
  String get followersUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'following_url')
  String get followingUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'gists_url')
  String get gistsUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'starred_url')
  String get starredUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'subscriptions_url')
  String get subscriptionsUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'organizations_url')
  String get organizationsUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'repos_url')
  String get reposUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'events_url')
  String get eventsUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'received_events_url')
  String get receivedEventsUrl => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'site_admin')
  bool get siteAdmin => throw _privateConstructorUsedError;
  @override
  int get contributions => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContributorCopyWith<_Contributor> get copyWith =>
      throw _privateConstructorUsedError;
}
