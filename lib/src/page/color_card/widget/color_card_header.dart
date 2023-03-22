import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/domain/reduce_waste/store/reduce_waste_provider.dart';
import 'package:yuv_quiz/src/domain/client/store/client_provider.dart';
import 'package:yuv_quiz/src/page/color_card/constant/selected_item.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_selection_option.dart';
import 'package:yuv_quiz/src/shared/widget/close_button.dart';
import 'package:yuv_quiz/src/shared/widget/filter_selection_button.dart';

class ColorCardHeader extends HookConsumerWidget {
  final CardView selectedCardView;
  final void Function(CardView) cardViewButtonOnPressed;

  const ColorCardHeader({
    super.key,
    required this.selectedCardView,
    required this.cardViewButtonOnPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.watch(clientProvider);
    final selectedReduceWasteOption = ref.watch(selectedReduceAmountProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 42.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            width: 11.0,
          ),
          // back button
          CustomCloseButton(
            onPressed: () {
              //mock up only
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Back button pressed'),
                ),
              );
            },
          ),
          const Spacer(flex: 1),
          // title
          client.when(
            error: (error, stack) => Container(),
            data: (value) => Text(
              ' ${value.name}',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 20.0,
              ),
            ),
            loading: () => Container(),
          ),
          const Spacer(flex: 2),
          Row(
            children: [
              FilterSelectionButton(
                onPressed: () => cardViewButtonOnPressed(CardView.overview),
                isSelected: selectedCardView == CardView.overview,
                text: 'Overview',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19.0),
                child: FilterSelectionButton(
                  onPressed: () => cardViewButtonOnPressed(CardView.details),
                  isSelected: selectedCardView == CardView.details,
                  text: 'Details',
                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  FilterSelectionButton(
                    onPressed: () => cardViewButtonOnPressed(CardView.activity),
                    isSelected: selectedCardView == CardView.activity,
                    text: 'Activity',
                  ),
                  if (selectedReduceWasteOption !=
                      ReduceWasteSelectionOption.none)
                    Positioned(
                      top: -5.0,
                      right: 0.0,
                      child: Container(
                        width: 18.0,
                        height: 18.0,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF0000),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
