import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/attribute.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';

class AttributesPage extends StatelessWidget {
  const AttributesPage(
    this.attributes, {
    Key? key,
  }) : super(key: key);

  final List<Attribute> attributes;

  @override
  Widget build(BuildContext context) => PlatformBuilder(
      cupertinoBuilder: (context, child) => Material(
            child: CupertinoPageScaffold(
              navigationBar:
                  const SwiftCupertinoBar(middle: Text('Attributes')),
              child: child!,
            ),
          ),
      materialBuilder: (context, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: child,
          ),
      builder: (context, d) => CustomScrollView(
            slivers: [
              if (d == PlatformDesign.material)
                const SliverAppBar(
                  title: Text('Attributes'),
                  pinned: true,
                  floating: true,
                ),
              SliverSafeArea(
                top: false,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) => AttributeTile(attributes[i]),
                    childCount: attributes.length,
                  ),
                ),
              ),
            ],
          ));
}

class AttributeTile extends StatelessWidget {
  const AttributeTile(
    this.att, {
    Key? key,
  }) : super(key: key);

  final Attribute att;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconTheme(
        data: const IconThemeData(color: Colors.white),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: att.icon ?? const Icon(CupertinoIcons.info_circle),
          ),
        ),
      ),
      title: Text(att.message!),
      dense: true,
      subtitle: Env.isDebugMode ? Text(att.code) : null,
      onTap: Env.isDebugMode
          ? () async => Clipboard.setData(ClipboardData(text: att.code))
          : null,
      trailing:
          Env.isDebugMode && att.icon == null ? const Text('Unhandled') : null,
    );
  }
}
