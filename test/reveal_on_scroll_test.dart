import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared/shared.dart';

/// The opacity currently applied to the revealed child.
double opacityOf(WidgetTester tester, Finder child) {
  final opacity = tester.widget<Opacity>(
    find.ancestor(of: child, matching: find.byType(Opacity)).first,
  );
  return opacity.opacity;
}

void main() {
  /// The trailing spacer matters: without it `maxScrollExtent` stops the list
  /// while the target's top edge is still below the trigger line, and nothing
  /// would ever reveal.
  Widget harness({required Widget target, double spacerHeight = 1200}) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: spacerHeight),
              target,
              const SizedBox(height: 1200),
            ],
          ),
        ),
      ),
    );
  }

  testWidgets('stays hidden while below the fold, reveals once scrolled to', (tester) async {
    tester.view.physicalSize = const Size(800, 600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    const label = Text('reveal me');
    await tester.pumpWidget(harness(target: const RevealOnScroll(child: label)));
    await tester.pump();

    final child = find.text('reveal me');
    expect(opacityOf(tester, child), 0.0, reason: 'off-screen content must start hidden');

    // Scroll it into view; the reveal is driven by the scroll position.
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -900));
    await tester.pumpAndSettle();

    expect(opacityOf(tester, child), 1.0, reason: 'content must be fully visible after scrolling to it');
  });

  testWidgets('reveals immediately when already on screen at first frame', (tester) async {
    tester.view.physicalSize = const Size(800, 600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      harness(target: const RevealOnScroll(child: Text('above fold')), spacerHeight: 0),
    );
    await tester.pumpAndSettle();

    expect(opacityOf(tester, find.text('above fold')), 1.0);
  });

  testWidgets('does not re-hide when scrolled back away', (tester) async {
    tester.view.physicalSize = const Size(800, 600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(harness(target: const RevealOnScroll(child: Text('sticky'))));
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -900));
    await tester.pumpAndSettle();

    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, 900));
    await tester.pumpAndSettle();

    expect(opacityOf(tester, find.text('sticky')), 1.0, reason: 'reveal is one-shot');
  });

  testWidgets('skips the animation entirely under reduced motion', (tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(disableAnimations: true, size: Size(800, 600)),
        child: harness(target: const RevealOnScroll(child: Text('reduced'))),
      ),
    );
    await tester.pumpAndSettle();

    expect(opacityOf(tester, find.text('reduced')), 1.0);
  });
}
