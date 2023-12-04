import 'package:ayana/uis/image_preview.dart';
import 'package:ayana/uilogics/trending_c.dart';
import 'package:ayana/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Treading extends GetResponsiveView {
  Treading({super.key});

  @override
  Widget builder() => GetBuilder<TreadingC>(
        init: TreadingC(),
        builder: (tc) {
          tc.updateViewPortFraction(screen.width);
          return Column(
            children: [
              Wrap(
                children: [
                  for (int i = 0; i < tc.trending.length; i++)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () => tc.onTrendingSelected(i),
                          child: Obx(
                            () => Text(
                              tc.trending[i].$1.toUpperCase(),
                              style: TextStyle(
                                color: tc.selectedTrend.value == i
                                    ? Get.theme.colorScheme.primary.darker(.46)
                                    : Get.theme.colorScheme.primary,
                                fontWeight: tc.selectedTrend.value == i
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        if (i < tc.trending.length - 1)
                          Text(
                            '/',
                            style: TextStyle(
                              fontSize: 24,
                              color: Get.theme.colorScheme.primary,
                            ),
                          )
                      ],
                    )
                ],
              ),
              const SizedBox(height: 30),
              Obx(
                () => AnimatedOpacity(
                  opacity: tc.isTrendingSelected.value ? 0 : 1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.decelerate,
                  child: SizedBox(
                    height: 500,
                    child: PageView(
                      controller: tc.pc,
                      onPageChanged: (value) => tc.activePage.value = value,
                      children: [
                        for (int i = tc.trending[tc.selectedTrend.value].$2;
                            i < tc.trending[tc.selectedTrend.value].$3;
                            i++)
                          ImagePreview(
                            key: Key(i.toString()),
                            imageIndex: i,
                            active: tc.activePage.value ==
                                (i - tc.trending[tc.selectedTrend.value].$2),
                            offset: tc.pageOffset.value,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          );
        },
      );
}
