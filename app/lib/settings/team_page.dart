import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import 'models/contributor.dart';

typedef JSON = Map<String, Object?>;

class TeamPage extends StatefulWidget {
  const TeamPage({
    Key? key,
  }) : super(key: key);

  static const primaryCoders = <Member>[
    Member(
      'Gaëtan Schwartz',
      role: 'Developer\nApp Concept/Design',
      imageUrl: 'assets/profiles/gaetan2.png',
      // websiteUrl: 'https://gaetanschwartz.com/#/',
      email: 'gaetan.schwartz@gmail.com',
      githubUrl: 'https://github.com/gaetschwartz',
    ),
    Member(
      'Abin W.',
      role: 'Testing, Icon design'
          '\nand ❤ ',
      imageUrl: 'assets/profiles/abin2.jpg',
    ),
  ];

  static const secondaryCoders = <Member>[
    Member(
      'David M.',
      role: 'Icon design\nTesting',
      imageUrl: 'assets/profiles/david.jpg',
    ),
    Member(
      'Vincent',
      role: 'Early work',
      isAssets: false,
    ),
    Member(
      'Alexandre',
      role: 'Testing',
    ),
  ];

  @override
  _TeamPageState createState() => _TeamPageState();
}

final _contributorsProvider = StateProvider<List<Contributor>?>((_) => null);

class _TeamPageState extends State<TeamPage> {
  final primaryMemberWidgets =
      TeamPage.primaryCoders.map((c) => _MemberTile(c)).toList(growable: false);
  final secondaryMembersWidgets =
      TeamPage.secondaryCoders.map((c) => _MemberTile(c)).toList(growable: false);

  final client = http.Client();

  @override
  void initState() {
    super.initState();
    getContributors();
  }

  Future<void> getContributors() async {
    final uri = Uri.parse('https://api.github.com/repos/gaetschwartz/swift_travel/contributors');
    final r = await client.get(uri);
    final list = jsonDecode(r.body) as List;
    final contribs = list.map((dynamic e) => Contributor.fromJson(e as JSON)).toList();

    context.read(_contributorsProvider).state = contribs;
  }

  @override
  void dispose() {
    client.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).our_team),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, i) => primaryMemberWidgets[i],
              childCount: primaryMemberWidgets.length,
            )),
            const SliverToBoxAdapter(child: ListTile(title: Text('Contributors'))),
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
                child: TextButton(
                  onPressed: () =>
                      showLicensePage(context: context, applicationIcon: const FlutterLogo()),
                  child: const Text('View licenses'),
                ),
              ),
            ),
          ],
        ),
      );
}

class _Contributors extends StatelessWidget {
  const _Contributors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, w, _) {
      final contribs = w(_contributorsProvider).state;
      if (contribs == null) {
        return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator.adaptive()));
      }
      return SliverPadding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 32,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              final c = contribs[i];
              return Tooltip(
                message: c.login,
                child: InkWell(
                  onTap: () => launch(c.htmlUrl),
                  customBorder: const CircleBorder(),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(c.avatarUrl),
                  ),
                ),
              );
            },
            childCount: contribs.length,
          ),
        ),
      );
    });
  }
}

class _MemberTile extends StatelessWidget {
  const _MemberTile(
    this.c, {
    Key? key,
  }) : super(key: key);

  final Member c;

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(c.name),
        leading: SizedBox(
          height: 36,
          width: 36,
          child: CircleAvatar(
            backgroundImage: c.imageUrl == null
                ? null
                : c.isAssets
                    ? AssetImage(c.imageUrl!) as ImageProvider
                    : NetworkImage(c.imageUrl!),
            child: c.imageUrl == null ? const FaIcon(FontAwesomeIcons.user, size: 18) : null,
          ),
        ),
        subtitle: c.role == null ? null : Text(c.role!),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: [
          if (c.websiteUrl != null)
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.paperclip),
                onPressed: () => launch(c.websiteUrl!)),
          if (c.githubUrl != null)
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.github), onPressed: () => launch(c.githubUrl!)),
          if (c.twitterUrl != null)
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.twitter),
                onPressed: () => launch(c.twitterUrl!)),
          if (c.email != null)
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.envelope),
                onPressed: () => launch('mailto:${c.email}')),
        ]),
        isThreeLine: true,
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
