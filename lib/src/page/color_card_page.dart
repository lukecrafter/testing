import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/page/constant/selected_item.dart';
import 'package:yuv_quiz/src/page/widget/color_card_header.dart';

class ColorCardPage extends HookConsumerWidget {
  const ColorCardPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCardView = useState<CardView>(CardView.overview);

    void cardViewButtonOnPressed(CardView cardView) {
      if (selectedCardView.value != cardView) {
        selectedCardView.value = cardView;
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            const SizedBox(height: 67.0),
            // header
            ColorCardHeader(
              selectedCardView: selectedCardView.value,
              cardViewButtonOnPressed: cardViewButtonOnPressed,
            ),
            Divider(
              color: const Color(0xFF707070).withOpacity(0.16),
              thickness: 1.0,
            ),
            // content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    Text('content'),
                  ],
                ),
              ),
            ),
            // button row
            Container(),
          ],
        ),
      ),
    );
  }
}
