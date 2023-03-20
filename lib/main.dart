import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  runZonedGuarded(() async {
    runApp(const ProviderScope(
      child: YuvSampleApp(),
    ));
  }, (Object error, StackTrace stack) {
    debugPrint(error.toString());
    debugPrint(stack.toString());
  });
}
