import 'package:ayana/uis/home_page.dart';
import 'package:ayana/configs/web_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
