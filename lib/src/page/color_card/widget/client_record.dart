import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/domain/client/mock/mock_record.dart';
import 'package:yuv_quiz/src/domain/client/store/client_provider.dart';
import 'package:yuv_quiz/src/page/color_card/widget/client_record_item.dart';

class ClientRecord extends ConsumerWidget {
  const ClientRecord({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientName = ref.watch(
      clientProvider.select(
        (value) => value.whenOrNull(
          data: (data) => data.name,
        ),
      ),
    );

    return Column(
      children: [
        Row(
          children: [
            // sample image
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 6.0,
                          offset: const Offset(0.0, 3.0),
                        ),
                      ],
                    ),
                    child: ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(colors: [
                          const Color(0xFFC92222).withOpacity(0.17),
                          const Color(0xFFC92222).withOpacity(0.17),
                        ]).createShader(bounds);
                      },
                      blendMode: BlendMode.overlay,
                      child: Image.asset(
                        'assets/images/base_image.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 45.0,
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1.0),
                    ),
                    child: Center(
                      child: Text(
                        'P',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 38.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '5.3',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 47.0,
                      ),
                    ),
                    const SizedBox(width: 25.0),
                    Text(
                      '/ 20V',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 47.0,
                        color: Colors.black.withOpacity(0.45),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Light brown gold',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 20.0,
                    color: Colors.black.withOpacity(0.42),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 30.0,
        ),
        Row(
          children: [
            ClientRecordItem(
              itemKey: 'client_name',
              text: clientName ?? '',
            ),
            const SizedBox(width: 16.5),
            for (final record in mockRecord.entries) ...[
              if (record.key != 'location')
                ClientRecordItem(
                  itemKey: record.key,
                  text: record.value,
                  extraText:
                      record.key == 'status' ? mockRecord['location'] : null,
                ),
              if (record.key != 'location' &&
                  record.key != mockRecord.keys.last)
                const SizedBox(width: 16.5),
            ],
          ],
        )
      ],
    );
  }
}
