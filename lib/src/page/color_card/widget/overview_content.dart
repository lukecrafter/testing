import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/page/color_card/widget/client_record.dart';
import 'package:yuv_quiz/src/page/color_card/widget/overview_item.dart';

class OverviewContent extends HookConsumerWidget {
  const OverviewContent({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 50.0,
            bottom: 70.0,
          ),
          child: ClientRecord(),
        ),
        Divider(
          color: const Color(0xFF707070).withOpacity(0.16),
          thickness: 1.0,
        ),
        const OverViewItem(
          imagePath: 'assets/images/bowl.png',
          title: '30g colour + 30g developer colour',
          description: '1/2 Tube + Developer',
          subtitle: '(60g)',
          subDescription: 'adjusted',
        ),
        const OverViewItem(
          imagePath: 'assets/images/device_plain.png',
          titleImagePath: 'assets/images/yuv_logo.png',
          titleImageWidth: 70.0,
          titleImageHeight: 20.0,
          title: 'lab',
          description: 'Select a yuv lab device',
        ),
        const OverViewItem(
          imagePath: 'assets/images/printer.png',
          title: 'Printer',
          description: 'Printer not selected',
        ),
      ],
    );
  }
}
