import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TreadingC extends GetxController with GetSingleTickerProviderStateMixin {
  final RxInt activePage = 0.obs, selectedTrend = 0.obs;
  late RxDouble pageOffset = activePage.value.toDouble().obs;
  final RxBool isTrendingSelected = false.obs;
  final List<(String, int, int)> trending = [
    ('bucket list', 0, 9),
    ('kids', 10, 19),
    ('wellness', 20, 29),
    ('romantic', 30, 39),
  ];
  late PageController pc = PageController(
    viewportFraction: 0.8,
    initialPage: activePage.value,
  );

  @override
  void onInit() {
    activePage.listen((p0) => update());
    super.onInit();
  }

  void updateViewPortFraction(double screenWidth) {
    pc = PageController(
      viewportFraction:
          lerpDouble(0.9, 0.2, (screenWidth.clamp(500, 1700) / 1700)) ?? 0.7,
      initialPage: activePage.value,
    );
    pc.addListener(() => pageOffset.value = pc.page ?? 0);
    update();
  }

  void onTrendingSelected(int index) {
    isTrendingSelected.value = true;
    selectedTrend.value = index;
    pc.animateTo(0,
        duration: const Duration(milliseconds: 100), curve: Curves.decelerate);
    Future.delayed(
      const Duration(milliseconds: 200),
      () => isTrendingSelected.value = false,
    );
  }

  @override
  void dispose() {
    pc.dispose();
    super.dispose();
  }
}