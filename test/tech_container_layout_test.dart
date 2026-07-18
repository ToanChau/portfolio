import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resource/resource.dart';
import 'package:shared/shared.dart';

/// A RenderFlex only reports its overflow while painting. Anything that skips
/// paint — an Opacity at 0, an offscreen sliver — hides the error, so the
/// widget under test must be visible for this to mean anything.
Future<void> pumpAtWidth(WidgetTester tester, double width) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: width,
            child: TechContainer(
              title: 'Mobile Development',
              icon: Assets.svg.icMobile,
              technologies: const [
                TechTagData(label: 'Flutter'),
                TechTagData(label: 'Clean Architecture'),
                TechTagData(label: 'GoRouter'),
              ],
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  testWidgets('header never overflows, however narrow the column gets', (tester) async {
    tester.view.physicalSize = const Size(1200, 2000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    for (double w = 40; w <= 400; w += 20) {
      await pumpAtWidth(tester, w);

      final exception = tester.takeException();
      expect(
        exception?.toString() ?? '',
        isNot(contains('overflow')),
        reason: 'TechContainer overflowed at width $w',
      );
    }
  });

  testWidgets('drops the icon rather than overflowing when cramped', (tester) async {
    tester.view.physicalSize = const Size(1200, 2000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await pumpAtWidth(tester, 300);
    expect(find.byType(SvgPicture), findsWidgets, reason: 'roomy column keeps its icon');

    await pumpAtWidth(tester, 80);
    expect(tester.takeException(), isNull);
  });

  testWidgets('title stays on at most two lines', (tester) async {
    tester.view.physicalSize = const Size(1200, 2000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await pumpAtWidth(tester, 140);

    final title = tester.widget<Text>(find.text('Mobile Development'));
    expect(title.maxLines, 2);
    expect(title.overflow, TextOverflow.ellipsis);
  });
}
