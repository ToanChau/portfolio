import 'package:flutter/material.dart';

class ScrollLoopAutoScroll extends StatefulWidget {
  const ScrollLoopAutoScroll({
    required this.child,
    required this.scrollDirection,
    super.key,
    this.delay = const Duration(seconds: 0),
    this.duration = const Duration(seconds: 150),
    this.gap = 25,
    this.reverseScroll = false,
    this.duplicateChild = 25,
    this.enableScrollInput = true,
    this.delayAfterScrollInput = const Duration(seconds: 1),
  });

  final Widget child;

  final Duration delay;

  final Duration duration;

  final double gap;

  final Axis scrollDirection;

  final bool reverseScroll;

  final int duplicateChild;

  final bool enableScrollInput;

  final Duration delayAfterScrollInput;

  @override
  State<ScrollLoopAutoScroll> createState() => _ScrollLoopAutoScrollState();
}

class _ScrollLoopAutoScrollState extends State<ScrollLoopAutoScroll>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late Animation<Offset> offset;

  ValueNotifier<bool> shouldScroll = ValueNotifier<bool>(false);
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();

    scrollController.addListener(() async {
      if (widget.enableScrollInput) {
        if (animationController.isAnimating) {
          animationController.stop();
        } else {
          await Future.delayed(widget.delayAfterScrollInput);
          if (mounted) {
            animationHandler();
          }
        }
      }
    });

    animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    offset = Tween<Offset>(
      begin: Offset.zero,
      end: widget.scrollDirection == Axis.horizontal
          ? widget.reverseScroll
              ? const Offset(.5, 0)
              : const Offset(-.5, 0)
          : widget.reverseScroll
              ? const Offset(0, .5)
              : const Offset(0, -.5),
    ).animate(animationController);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(widget.delay);
      if (mounted) {
        animationHandler();
      }
    });

    super.initState();
  }

  Future<void> animationHandler() async {
    if (scrollController.position.maxScrollExtent > 0) {
      shouldScroll.value = true;

      if (shouldScroll.value && mounted) {
        animationController.forward().then((_) async {
          animationController.reset();

          if (shouldScroll.value && mounted) {
            animationHandler();
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: widget.enableScrollInput
          ? const BouncingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      controller: scrollController,
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverseScroll,
      child: SlideTransition(
        position: offset,
        child: ValueListenableBuilder<bool>(
          valueListenable: shouldScroll,
          builder: (BuildContext context, bool shouldScroll, _) {
            return widget.scrollDirection == Axis.horizontal
                ? Row(
                    children: List.generate(
                        widget.duplicateChild,
                        (index) => Padding(
                              padding: EdgeInsets.only(
                                  right: shouldScroll && !widget.reverseScroll
                                      ? widget.gap
                                      : 0,
                                  left: shouldScroll && widget.reverseScroll
                                      ? widget.gap
                                      : 0),
                              child: widget.child,
                            )))
                : Column(
                    children: List.generate(
                    widget.duplicateChild,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                          bottom: shouldScroll && !widget.reverseScroll
                              ? widget.gap
                              : 0,
                          top: shouldScroll && widget.reverseScroll
                              ? widget.gap
                              : 0),
                      child: widget.child,
                    ),
                  ));
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
