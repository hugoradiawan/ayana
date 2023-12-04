import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorPalette extends GetxController {
  final Rxn<PaletteGenerator> palette =
      Rxn<PaletteGenerator>(PaletteGenerator.fromColors(
    [PaletteColor(Colors.transparent, 20)],
  ));
  final Rxn<NetworkImage> imageProvider = Rxn<NetworkImage>();
  final String imageUrl;

  ColorPalette(this.imageUrl);

  @override
  void onInit() {
    updatePalette();
    super.onInit();
  }

  Future<void> updatePalette() async {
    imageProvider.value = NetworkImage(imageUrl, scale: 0.1);
    if (imageUrl.isNotEmpty) {
      try {
        palette.value =
            await PaletteGenerator.fromImageProvider(imageProvider.value!);
      } catch (e) {
        palette.value = PaletteGenerator.fromColors(
          [PaletteColor(Colors.transparent, 20)],
        );
      }
    } else {
      palette.value = PaletteGenerator.fromColors(
        [PaletteColor(Colors.transparent, 20)],
      );
    }
  }

  Color get darkVibrantColor => palette.value?.darkVibrantColor != null
      ? palette.value!.darkVibrantColor!.color
      : (palette.value?.darkMutedColor != null
          ? palette.value!.darkMutedColor!.color
          : Colors.white);

  Color get lightVibrantColor => palette.value?.lightVibrantColor != null
      ? palette.value!.lightVibrantColor!.color
      : (palette.value?.lightMutedColor != null
          ? palette.value!.lightMutedColor!.color
          : Colors.white);
}
