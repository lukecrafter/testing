import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/page/reduce_waste/widget/reduce_estimate_result.dart';

class ReduceWasteContent extends HookConsumerWidget {
  const ReduceWasteContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 66.0,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Reduce Waste',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 50.0,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 48.0,
        ),
        const ReduceEstimateResult(),
      ],
    );
  }
}
