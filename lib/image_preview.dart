import 'package:ayana/color_palette.dart';
import 'package:ayana/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({
    required this.imageIndex,
    this.active = false,
    this.offset = 0,
    super.key,
  });

  final int imageIndex;
  final bool active;
  final double offset;

  @override
  Widget build(_) {
    final String imageUrl =
        'https://picsum.photos/seed/${imageIndex + 1}/500/500';
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.symmetric(
        horizontal: active ? 0 : 10,
        vertical: active ? 0 : 20,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GetBuilder<ColorPalette>(
          init: ColorPalette(
            imageUrl,
          ),
          tag: imageUrl,
          builder: (cp) => Stack(
            children: [
              CachedNetworkImage(
                imageUrl: cp.imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  width: 700,
                  height: 500,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fitHeight,
                      alignment: Alignment(
                        (offset.abs() - (imageIndex + 1)).clamp(-1, 0),
                        0,
                      ),
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              // gradient container
              Container(
                width: 700,
                height: 500,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      cp.darkVibrantColor.withOpacity(0.75),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Test Judul 123',
                        style: TextStyle(
                          color: cp.lightVibrantColor.lighter(0.3),
                          fontSize: 27,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Ini Text Deskripsi panjang banget 123 Hebat loh Bagus 123 Bandung Community',
                        style: TextStyle(
                          color: cp.lightVibrantColor.lighter(0.3),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SvgPicture.asset(
                        'assets/arrow.svg',
                        colorFilter: ColorFilter.mode(
                          cp.lightVibrantColor.lighter(0.3),
                          BlendMode.srcATop,
                        ),
                        width: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
