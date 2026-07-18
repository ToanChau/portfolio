import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared/shared.dart';

const _leftKey = ValueKey('left');
const _rightKey = ValueKey('right');
const _gap = 24.0;

/// The card's bounds after its 3D transform is applied, in global coordinates.
/// This is what actually gets painted, as opposed to the untransformed layout
/// rect that [WidgetTester.getRect] reports.
Rect paintedRect(WidgetTester tester, Key key) {
  final box = tester.renderObject<RenderBox>(find.byKey(key));
  return MatrixUtils.transformRect(box.getTransformTo(null), Offset.zero & box.size);
}

Widget twoCards() {
  Widget card(Key key) => TiltCard(
    child: Container(key: key, height: 300, color: const Color(0xFF1A1F28)),
  );

  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: card(_leftKey)),
              const SizedBox(width: _gap),
              Expanded(child: card(_rightKey)),
            ],
          ),
        ),
      ),
    ),
  );
}

void main() {
  /// Hovers [target] at [fraction] across its width (0 = left edge, 1 = right).
  /// The caller owns the returned gesture and must remove its pointer before
  /// starting another hover, or the mouse tracker asserts on the second add.
  Future<TestGesture> hover(WidgetTester tester, Key target, double fraction) async {
    final rect = tester.getRect(find.byKey(target));
    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: rect.center);
    await tester.pump();

    await gesture.moveTo(Offset(rect.left + rect.width * fraction, rect.center.dy));
    await tester.pumpAndSettle();
    return gesture;
  }

  testWidgets('a hovered card never paints into its neighbour', (tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    for (final fraction in <double>[0.0, 0.5, 1.0]) {
      await tester.pumpWidget(twoCards());
      final neighbourLeft = tester.getRect(find.byKey(_rightKey)).left;

      final gesture = await hover(tester, _leftKey, fraction);
      final painted = paintedRect(tester, _leftKey);
      await gesture.removePointer();
      await tester.pump();

      expect(
        painted.right,
        lessThanOrEqualTo(neighbourLeft),
        reason: 'hovering at fraction $fraction pushed the card ${painted.right - neighbourLeft}px '
            'into the neighbouring card, which paints on top of it',
      );
    }
  });

  testWidgets('hover lifts the card upward rather than widening it', (tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(twoCards());
    final resting = paintedRect(tester, _leftKey);

    final gesture = await hover(tester, _leftKey, 0.5);
    final lifted = paintedRect(tester, _leftKey);
    await gesture.removePointer();

    expect(lifted.top, lessThan(resting.top), reason: 'card should rise');
    expect(
      lifted.width,
      closeTo(resting.width, 1.0),
      reason: 'a centred hover must not widen the card',
    );
  });
}
