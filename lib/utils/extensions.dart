import 'package:flutter/widgets.dart';

extension ColorExt on Color {
  Color lighter(double value) => Color.fromARGB(
        alpha,
        red + ((255 - red) * value).toInt(),
        green + ((255 - green) * value).toInt(),
        blue + ((255 - blue) * value).toInt(),
      );

  Color darker(double value) => Color.fromARGB(
        alpha,
        red - ((red) * value).toInt(),
        green - ((green) * value).toInt(),
        blue - ((blue) * value).toInt(),
      );
}