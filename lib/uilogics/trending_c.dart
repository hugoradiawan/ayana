import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TreadingC extends GetxController with GetSingleTickerProviderStateMixin {
  final RxInt activePage = 0.obs, selectedTrend = 0.obs;
  late RxDouble pageOffset = activePage.value.toDouble().obs;
  final RxBool isTrendingSelected = false.obs;
  final Curve curve = Curves.decelerate;
  final List<(String, int, int)> trending = [
    ('bucket list', 0, 19),
    ('kids', 10, 39),
    ('wellness', 40, 59),
    ('romantic', 60, 79),
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
      viewportFraction: lerpDouble(
              1.2, 0.2, curve.transform(screenWidth.clamp(500, 1700) / 1700)) ??
          0.7,
      initialPage: activePage.value,
    );
    pc.addListener(() => pageOffset.value = pc.page ?? 0);
    update();
  }

  Future<void> onTrendingSelected(int index) async {
    isTrendingSelected.value = true;
    selectedTrend.value = index;
    await Future.delayed(const Duration(milliseconds: 300));
    pc.animateTo(0,
        duration: const Duration(milliseconds: 400), curve: Curves.decelerate);
    isTrendingSelected.value = false;
  }

  @override
  void dispose() {
    pc.dispose();
    super.dispose();
  }
}
