import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/page/widget/color_card_header.dart';

class ColorCardPage extends HookConsumerWidget {
  const ColorCardPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double topPadding = 67.0;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            SizedBox(height: topPadding),
            // header
            const ColorCardHeader(),
            // content
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: const [
                  // color card]
                ],
              ),
            )),
            // button row
            Container(),
          ],
        ),
      ),
    );
  }
}
