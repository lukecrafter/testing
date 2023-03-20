import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/page/constant/selected_item.dart';
import 'package:yuv_quiz/src/page/widget/color_card_header.dart';
import 'package:yuv_quiz/src/page/widget/overview_content.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 32.5),
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
                child: selectedCardView.value == CardView.overview
                    ? const OverviewContent()
                    : selectedCardView.value == CardView.details
                        ? const Center(
                            child: Text(
                              'Details Content. Coming soon...',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          )
                        : const Center(
                            child: Text(
                              'Activity Content. Coming soon...',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
