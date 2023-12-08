import 'package:doughnut_shop/app/resources/color_manager.dart';
import 'package:flutter/material.dart';

class RippleWidget extends StatelessWidget {
  final Rect? rect;
  final Duration animationDuration;
  const RippleWidget({super.key, this.rect, required this.animationDuration});

  @override
  Widget build(BuildContext context) {
    if (rect == null) {
      return Container();
    }
    return AnimatedPositioned(
      duration: animationDuration,
      left: rect!.left,
      right: MediaQuery.of(context).size.width - rect!.right,
      top: rect!.top,
      bottom: MediaQuery.of(context).size.height - rect!.bottom,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorManager.primary,
        ),
      ),
    );
  }
}
