import 'package:flutter/material.dart';
import 'package:yuv_quiz/src/page/color_card_page.dart';
import 'package:yuv_quiz/src/shared/config/no_scroll_glow_behavior.dart';

class YuvSampleApp extends StatelessWidget {
  const YuvSampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yuv Sample App',
      scrollBehavior: NoScrollGlowBehavior(),
      debugShowCheckedModeBanner: false,
      home: const ColorCardPage(),
      theme: ThemeData(useMaterial3: true),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: DefaultTextStyle(
            style: const TextStyle(
              height: 1.0,
            ),
            child: child!,
          ),
        );
      },
    );
  }
}
