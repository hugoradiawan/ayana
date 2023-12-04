import 'package:ayana/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const AyanaGuestApp());

class AyanaGuestApp extends StatelessWidget {
  const AyanaGuestApp({super.key});

  @override
  Widget build(_) => GetMaterialApp(
        scrollBehavior: WebScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: 'AYANA Guest App',
        theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(255, 120, 90, 0),
          useMaterial3: true,
        ),
        home: const Homepage(),
      );
}

class WebScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
