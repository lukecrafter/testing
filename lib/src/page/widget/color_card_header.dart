import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/domain/user/store/user_provider.dart';
import 'package:yuv_quiz/src/page/constant/selected_item.dart';
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
    final user = ref.watch(userProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 42.0),
      child: Row(
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
          const SizedBox(
            width: 38.3,
          ),
          // title
          Expanded(
            child: user.when(
              error: (error, stack) => Container(),
              data: (value) => Text(
                ' ${value.userName}',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 20.0,
                ),
              ),
              loading: () => Container(),
            ),
          ),
          FilterSelectionButton(
            onPressed: () {
              cardViewButtonOnPressed(CardView.overview);
              //mock up only
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Filter button pressed'),
                ),
              );
            },
            isSelected: selectedCardView == CardView.overview,
            text: 'Overview',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19.0),
            child: FilterSelectionButton(
              onPressed: () {
                cardViewButtonOnPressed(CardView.details);
                //mock up only
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Filter button pressed'),
                  ),
                );
              },
              isSelected: selectedCardView == CardView.details,
              text: 'Details',
            ),
          ),
          FilterSelectionButton(
            onPressed: () {
              cardViewButtonOnPressed(CardView.activity);
              //mock up only
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Filter button pressed'),
                ),
              );
            },
            isSelected: selectedCardView == CardView.activity,
            text: 'Activity',
          ),
        ],
      ),
    );
  }
}
