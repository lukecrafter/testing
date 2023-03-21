import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ClientRecordItem extends HookConsumerWidget {
  final String itemKey;
  final String text;
  final String? extraText;

  const ClientRecordItem({
    super.key,
    required this.itemKey,
    required this.text,
    this.extraText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.0),
        color: const Color(0xFFDDDDDD).withOpacity(0.57),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: extraText != null
          ? RichText(
              text: TextSpan(
                text: text,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black.withOpacity(0.57),
                ),
                children: [
                  const WidgetSpan(
                    child: SizedBox(
                      width: 25.0,
                    ),
                  ),
                  TextSpan(
                    text: extraText,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black.withOpacity(0.25),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : Text(
              text,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black.withOpacity(0.57),
              ),
            ),
    );
  }
}
