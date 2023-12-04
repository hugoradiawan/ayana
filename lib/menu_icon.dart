import 'package:ayana/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key, required this.label});

  final String label;

  @override
  Widget build(_) => Container(
        margin: const EdgeInsets.all(6),
        height: 100,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/ic-${label.toLowerCase().replaceAll(' ', '-')}.svg',
              colorFilter: ColorFilter.mode(
                Get.theme.colorScheme.primary.darker(0.5),
                BlendMode.srcIn,
              ),
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 10),
            Text(label),
          ],
        ),
      );
}
