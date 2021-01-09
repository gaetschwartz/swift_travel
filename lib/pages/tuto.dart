import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:swift_travel/generated/l10n.dart';

class Tuto extends StatelessWidget {
  const Tuto();

  static List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      title: 'First page',
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      image: const Center(child: Icon(Icons.android)),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: listPagesViewModel,
      onDone: () => Navigator.of(context).pop(),
      showSkipButton: kDebugMode,
      skip: const Icon(Icons.skip_next),
      next: const Icon(Icons.arrow_forward_ios),
      done: Text(Strings.of(context).done, style: const TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).accentColor,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 4.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
