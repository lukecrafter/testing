import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EstimateResultItem extends HookConsumerWidget {
  // TODO: ask what it is and what is the difference between colorWeight and developerWeight
  // TODO: ask is it just simply divide the amount of totalWeight by 2
  final String hints;
  final double totalWeight;
  final String description;
  final Color backgroundColor;
  final Color bodyTextColor;
  final Color? descriptionColor;

  const EstimateResultItem({
    super.key,
    required this.hints,
    required this.totalWeight,
    required this.description,
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.bodyTextColor = Colors.black,
    this.descriptionColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(
          hints,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 19.0,
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.47),
          ),
        ),
        const SizedBox(
          height: 19.25,
        ),
        Container(
          width: 206.8,
          height: 156.17,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(28.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${totalWeight.toStringAsFixed(0)}g',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 46.0,
                  fontWeight: FontWeight.w500,
                  color: bodyTextColor,
                ),
              ),
              Text(
                description,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: descriptionColor ?? Colors.black.withOpacity(0.25),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
