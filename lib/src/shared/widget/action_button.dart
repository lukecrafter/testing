import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ActionButton extends HookConsumerWidget {
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final EdgeInsets padding;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.borderColor,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 19.0,
      vertical: 6.0,
    ),
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          // TODO: update border radius
          borderRadius: BorderRadius.circular(12.0),
          color: backgroundColor,
        ),
        padding: padding,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
