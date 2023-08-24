import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/platform_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'models/contributor.dart';

typedef JSON = Map<String, Object?>;

final _contributorsProvider = FutureProvider<List<Contributor>>((_) async {
  final uri = Uri.parse(
      'https://api.github.com/repos/gaetschwartz/swift_travel/contributors');
  final r = await http.get(uri);
  final list = jsonDecode(r.body) as List;
  final contribs =
      list.map((dynamic e) => Contributor.fromJson(e as JSON)).toList();

  return contribs;
});

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  static const mainTeam = <Member>[
    Member(
      'Gaëtan Schwartz',
      role: 'Developer\nApp Concept/Design',
      imageUrl: 'assets/profiles/gaetan2.png',
      // websiteUrl: 'https://gaetanschwartz.com/#/',
      email: 'gaetan.schwartz@gmail.com',
      githubUrl: 'https://github.com/gaetschwartz',
    ),
  ];

  static const morePeople = <Member>[
    Member(
      'David M.',
      role: 'Icon design, testing',
      imageUrl: 'assets/profiles/david.jpg',
    ),
    Member(
      'Alexandre',
      role: 'Testing',
    ),
    Member(
      'Abin W.',
      role: 'Testing, Icon design',
      imageUrl: 'assets/profiles/abin.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
      cupertinoBuilder: (context, child) => Material(
        child: CupertinoPageScaffold(
          resizeToAvoidBottomInset: false,
          navigationBar: const SwiftCupertinoBar(),
          child: child!,
        ),
      ),
      materialBuilder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).about_the_app),
        ),
        body: child,
      ),
      builder: (context, design) => _Main(),
    );
  }
}

class _Main extends StatefulWidget {
  @override
  State<_Main> createState() => _MainState();
}

class _MainState extends State<_Main> {
  final client = http.Client();

  @override
  void dispose() {
    client.close();
    super.dispose();
  }

  final primaryMemberWidgets = TeamPage.mainTeam
      .map((c) => _MemberTile(c, dense: true))
      .toList(growable: false);

  final secondaryMembersWidgets = TeamPage.morePeople
      .map((c) => _MemberTile(c, dense: true))
      .toList(growable: false);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverSafeArea(
          bottom: false,
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, i) => primaryMemberWidgets[i],
            childCount: primaryMemberWidgets.length,
          )),
        ),
        const SliverToBoxAdapter(
          child: ListTile(
            // horizontalTitleGap: 0,
            leading: FaIcon(FontAwesomeIcons.github),
            title: Text('Github Contributors'),
          ),
        ),
        const _Contributors(),
        SliverToBoxAdapter(
          child: ExpansionTile(
            title: const Text('Helpers'),
            children: secondaryMembersWidgets,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            width: double.infinity,
            height: 64,
            child: PlatformButton(
              onPressed: () => showLicensePage(context: context),
              child: const Text('Licenses'),
            ),
          ),
        ),
      ],
    );
  }
}

class _Contributors extends StatelessWidget {
  const _Contributors();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, w, _) {
      return w.watch(_contributorsProvider).when(data: (contribs) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              final c = contribs[i];
              return ListTile(
                leading: SizedBox(
                  height: 36,
                  width: 36,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(c.avatarUrl),
                  ),
                ),
                onTap: () async => launchUrlString(c.htmlUrl),
                title: Text(c.login),
              );
            },
            childCount: contribs.length,
          ),
        );
      }, loading: () {
        return const SliverFillRemaining(
          child: Center(child: CircularProgressIndicator.adaptive()),
        );
      }, error: (e, s) {
        return SliverToBoxAdapter(child: Text(e.toString()));
      });
    });
  }
}

class _MemberTile extends StatelessWidget {
  const _MemberTile(
    this.c, {
    this.dense = false,
  });

  final Member c;
  final bool dense;

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(c.name),
        dense: dense,
        leading: SizedBox(
          height: 36,
          width: 36,
          child: CircleAvatar(
            backgroundImage: (c.imageUrl == null
                ? null
                : c.isAssets
                    ? AssetImage(c.imageUrl!)
                    : NetworkImage(c.imageUrl!)) as ImageProvider?,
            child: c.imageUrl == null
                ? const FaIcon(FontAwesomeIcons.user, size: 18)
                : null,
          ),
        ),
        subtitle: c.role == null ? null : Text(c.role!),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: [
          if (c.websiteUrl != null)
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.paperclip),
                onPressed: () async => launchUrlString(c.websiteUrl!)),
          if (c.githubUrl != null)
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.github),
                onPressed: () async => launchUrlString(c.githubUrl!)),
          if (c.twitterUrl != null)
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.twitter),
                onPressed: () async => launchUrlString(c.twitterUrl!)),
          if (c.email != null)
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.envelope),
                onPressed: () async => launchUrlString('mailto:${c.email}')),
        ]),
      );
}

@immutable
class Member {
  const Member(
    this.name, {
    this.isAssets = true,
    this.twitterUrl,
    this.role,
    this.imageUrl,
    this.websiteUrl,
    this.email,
    this.githubUrl,
  });

  final String name;
  final String? twitterUrl;
  final String? role;
  final String? imageUrl;
  final String? websiteUrl;
  final String? email;
  final String? githubUrl;
  final bool isAssets;
}
