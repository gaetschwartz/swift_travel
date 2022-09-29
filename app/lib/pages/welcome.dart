// ignore_for_file: cascade_invocations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:swift_travel/l10n/app_localizations.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: BezierClipper(),
                child: Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.red,
                        Colors.orange,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ClipPath(
                clipper: BezierClipper2(),
                child: Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.red,
                        Colors.orange,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Welcome to Swift Travel',
                            style: Theme.of(context).textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Gap(8),
                        const Center(
                          child: Text(
                            'We will help you 🚄🚶🏼‍♂️🚎🚶🏻‍♀🚌 !',
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 48,
                        child: ElevatedButton.icon(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.white,
                            foregroundColor: Theme.of(context).primaryColor,
                          ),
                          icon: const Icon(Icons.skip_next),
                          label: const Text('Skip tutorial'),
                        ),
                      ),
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder()),
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/tuto');
                          },
                          child: Row(
                            children: [
                              Text(AppLocalizations.of(context).continue_),
                              const Gap(8),
                              const Icon(CupertinoIcons.chevron_forward),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(32),
                ],
              ),
            ),
          ],
        ),
      );
}

class BezierClipper2 extends CustomClipper<Path> {
  BezierClipper2();

  Path _getFinalClip(Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width, 0);
    path_0.quadraticBezierTo(
        size.width * 1.01, size.height * 0.40, size.width, size.height * 0.34);
    path_0.cubicTo(size.width * 0.49, size.height * 0.01, size.width * 0.54,
        size.height * 0.76, size.width * 0.33, size.height * 0.76);
    path_0.cubicTo(size.width * 0.16, size.height * 0.76, size.width * 0.08,
        size.height * 0.16, size.width * 0.05, size.height * 0.07);
    path_0.quadraticBezierTo(size.width * 0.03, size.height * 0.01, 0, 0);

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  @override
  Path getClip(Size size) => _getFinalClip(size);
}

class BezierClipper extends CustomClipper<Path> {
  BezierClipper();

  Path _getFinalClip(Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width, size.height);
    path_0.quadraticBezierTo(
        size.width * 1.00, size.height * 0.44, size.width, size.height * 0.37);
    path_0.cubicTo(size.width * 0.97, size.height * 0.34, size.width * 0.74,
        size.height * 0.20, size.width * 0.59, size.height * 0.64);
    path_0.cubicTo(size.width * 0.44, size.height * 1.02, size.width * 0.42,
        size.height * 0.80, size.width * 0.26, size.height * 0.66);
    path_0.quadraticBezierTo(
        size.width * 0.10, size.height * 0.57, 0, size.height);

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  @override
  Path getClip(Size size) => _getFinalClip(size);
}
