import 'package:ayana/utils/extensions.dart';
import 'package:ayana/menu_icon.dart';
import 'package:ayana/trending.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(_) => Scaffold(
        appBar: AppBar(title: SvgPicture.asset('assets/logo.svg')),
        body: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              color: Get.theme.colorScheme.primary.withOpacity(0.1),
              child: Wrap(
                runAlignment: WrapAlignment.center,
                children: [
                  'Dining',
                  'Spa',
                  'Experiences',
                  'Tram',
                  'Room Service',
                ].map((label) => MenuIcon(label: label)).toList(),
              ),
            ),
            SizedBox(
              height: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Inspired',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Get.theme.colorScheme.primary.darker(.2),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Based on what's trending right now",
                    style: TextStyle(
                      color: Get.theme.colorScheme.primary.darker(.2),
                    ),
                  ),
                ],
              ),
            ),
            Treading(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Get.theme.colorScheme.primary,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Get.theme.colorScheme.primary,
          selectedIconTheme:
              IconThemeData(color: Get.theme.colorScheme.primary),
          items: ['Explore', 'Chat', 'Map', 'Profile']
              .map((e) => BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/ic-${e.toLowerCase()}.svg',
                    ),
                    label: e,
                  ))
              .toList(),
        ),
      );
}
