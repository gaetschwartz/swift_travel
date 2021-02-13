import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/apis/search.ch/models/attribute.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:theming/responsive.dart';

class AttributesPage extends StatelessWidget {
  final List<Attribute> attributes;

  const AttributesPage(
    this.attributes, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isDarwin = Responsive.isDarwin(context);
    return IfWrapper(
        condition: isDarwin,
        builder: (context, child) => Material(
              child: CupertinoPageScaffold(
                child: child!,
                navigationBar: cupertinoBar(context, middle: const Text('Attributes')),
              ),
            ),
        elseBuilder: (context, child) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: child,
            ),
        child: CustomScrollView(
          slivers: [
            if (!isDarwin)
              const SliverAppBar(
                title: Text('Attributes'),
                pinned: true,
                floating: true,
              ),
            SliverSafeArea(
              top: false,
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    return buildAttributeTile(attributes[i]);
                  },
                  childCount: attributes.length,
                ),
              ),
            ),
          ],
        ));
  }

  static Widget buildAttributeTile(Attribute att) {
    return ListTile(
      leading: IconTheme(
        data: const IconThemeData(color: Colors.white),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: att.icon ?? const Icon(CupertinoIcons.info_circle),
          ),
        ),
      ),
      title: Text(att.message!),
      dense: true,
    );
  }
}
