import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomCloseButton extends HookConsumerWidget {
  final double buttonSize;
  final double iconSize;
  final Color buttonColor;
  final Color iconColor;
  final VoidCallback? onPressed;

  const CustomCloseButton({
    super.key,
    this.buttonSize = 45.0,
    this.iconSize = 15.95,
    this.buttonColor = const Color(0xFFFFE5E5),
    this.iconColor = const Color(0xFFFF0000),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: buttonColor,
      ),
      child: IconButton(
        iconSize: iconSize,
        color: iconColor,
        icon: const Icon(Icons.close),
        onPressed: onPressed,
      ),
    );
  }
}
