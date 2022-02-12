import 'dart:async';
import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final double delay;
  final Widget child;
  final Offset offset;

  const FadeAnimation(this.delay, this.child, this.offset, {Key? key})
      : super(key: key);

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    Timer(Duration(milliseconds: (500 * widget.delay).round()),
        () => _animationController.forward());

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tween = Tween<Offset>(
      begin: widget.offset,
      end: Offset.zero,
    ).animate(_animationController);
    return SlideTransition(
      position: tween,
      child: FadeTransition(
        opacity: _animationController,
        child: widget.child,
      ),
    );
  }
}
