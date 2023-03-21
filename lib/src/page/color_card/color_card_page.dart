import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/page/color_card/constant/selected_item.dart';
import 'package:yuv_quiz/src/page/color_card/widget/color_card_header.dart';
import 'package:yuv_quiz/src/page/color_card/widget/overview_content.dart';
import 'package:yuv_quiz/src/page/color_card/widget/overviwe_action_section.dart';
import 'package:yuv_quiz/src/page/reduce_waste/reduce_waste_page.dart';

class ColorCardPage extends HookConsumerWidget {
  const ColorCardPage({super.key});

  Future<void> pushToReduceWastePage(context) async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) {
          return const ReduceWastePage();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);

          const fadeBegin = 0.0;
          const fadeEnd = 1.0;
          final fadeTween = Tween(begin: fadeBegin, end: fadeEnd);

          const curve = Curves.easeInOut;

          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  color: Colors.black.withOpacity(0.3 * animation.value),
                ),
              ),
              SlideTransition(
                position: tween.animate(curvedAnimation),
                child: FadeTransition(
                  opacity: fadeTween.animate(curvedAnimation),
                  child: Opacity(
                    opacity: animation.value,
                    child: child,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCardView = useState<CardView>(CardView.overview);

    void cardViewButtonOnPressed(CardView cardView) {
      if (selectedCardView.value != cardView) {
        selectedCardView.value = cardView;
      }
    }

    final isInitialPushedReducedPage = useState<bool>(false);
    final isPushed = useState<bool>(false);

    useEffect(() {
      if (!isInitialPushedReducedPage.value) {
        isInitialPushedReducedPage.value = true;
        Future.delayed(
          const Duration(seconds: 3),
          () => pushToReduceWastePage(context),
        );
      }
      return null;
    }, [isInitialPushedReducedPage.value]);

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
                    ? GestureDetector(
                        onTap: () async {
                          if (!isPushed.value) {
                            isPushed.value = true;
                            await pushToReduceWastePage(context);
                            isPushed.value = false;
                          }
                        },
                        child: const OverviewContent(),
                      )
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
            const Padding(
              padding: EdgeInsets.only(
                left: 32.0,
                right: 32.0,
                bottom: 26.0,
              ),
              child: OverviewActionSection(),
            ),
          ],
        ),
      ),
    );
  }
}
