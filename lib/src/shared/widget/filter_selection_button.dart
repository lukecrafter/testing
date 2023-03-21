import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterSelectionButton extends HookConsumerWidget {
  final String text;
  final bool isSelected;
  final EdgeInsets padding;
  final VoidCallback onPressed;

  const FilterSelectionButton({
    super.key,
    required this.text,
    required this.isSelected,
    this.padding = const EdgeInsets.only(
      left: 19.0,
      right: 19.0,
      top: 8.0,
      bottom: 8.0,
    ),
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(19.0),
        ),
        padding: padding,
        child: Text(
          text,
          // TODO: update font Helvetica Neue
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
