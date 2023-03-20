import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/shared/widget/action_button.dart';

class ReduceWasteActionRow extends HookConsumerWidget {
  const ReduceWasteActionRow({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                'Calculate your exact wastage',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 16.0,
                  color: Colors.black.withOpacity(
                    0.42,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ActionButton(
                text: 'Weigh bowl',
                borderColor: const Color(0xFF707070),
                backgroundColor: Colors.white,
                textColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 26.8),
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 27.0,
        ),
        Expanded(
          child: Column(
            children: [
              ActionButton(
                text: 'Continue',
                borderColor: Colors.black,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 26.8),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
