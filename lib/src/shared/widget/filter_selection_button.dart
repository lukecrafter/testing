import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterSelectionButton extends HookConsumerWidget {
  final VoidCallback onPressed;
  final bool isSelected;
  final String text;
  final EdgeInsets padding;

  const FilterSelectionButton({
    super.key,
    required this.onPressed,
    required this.isSelected,
    required this.text,
    this.padding = const EdgeInsets.only(
      left: 19.0,
      right: 19.0,
      top: 8.0,
      bottom: 8.0,
    ),
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
        ),
      ),
    );
  }
}
