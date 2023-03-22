import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OverViewItem extends HookConsumerWidget {
  final String imagePath;
  final String? titleImagePath;
  final double? titleImageWidth;
  final double? titleImageHeight;
  final String? title;
  final String description;
  final String? subtitle;
  final String? subDescription;

  const OverViewItem({
    super.key,
    required this.imagePath,
    this.titleImageWidth,
    this.titleImageHeight,
    this.titleImagePath,
    this.title,
    required this.description,
    this.subtitle,
    this.subDescription,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            SizedBox(
              width: 128.0,
              height: 128.0,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 31.8,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      if (titleImagePath != null) ...[
                        Image.asset(
                          titleImagePath!,
                          width: titleImageWidth,
                          height: titleImageHeight,
                        ),
                        const SizedBox(width: 2.3),
                      ],
                      Text(
                        title ?? '',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(flex: 1),
                      Text(
                        subtitle ?? '',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.19),
                        ),
                      ),
                      const Spacer(flex: 3),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.47),
                        ),
                      ),
                      const SizedBox(width: 31.2),
                      Text(
                        subDescription ?? '',
                        style: const TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0045FF),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              size: 17.0,
            ),
            const SizedBox(
              width: 46.4,
            )
          ],
        ),
        Divider(
          color: const Color(0xFF707070).withOpacity(0.16),
          thickness: 1.0,
        ),
      ],
    );
  }
}
