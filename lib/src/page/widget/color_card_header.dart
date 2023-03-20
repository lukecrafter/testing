import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/domain/user/store/user_provider.dart';
import 'package:yuv_quiz/src/shared/widget/close_button.dart';

class ColorCardHeader extends HookConsumerWidget {
  const ColorCardHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Row(
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
        user.when(
          error: (error, stack) => Container(),
          data: (value) => Text(
            ' ${value.userName}',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 20.0,
            ),
          ),
          loading: () => Container(),
        ),

        Container(),
      ],
    );
  }
}
