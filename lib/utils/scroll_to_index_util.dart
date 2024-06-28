import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollToIndexUtil {
  static void scrollToIndex({
    required int index,
    required int listLength,
    required ScrollController scrollController,
    required double itemHeight,
    required double constraintsHeight,
  }) {
    if (index >= 0 && index < listLength) {
      double offset = 0;

      final itemPosition = index * itemHeight;
      final maxScrollExtent = scrollController.position.maxScrollExtent;
      offset = itemPosition - (constraintsHeight - itemHeight) / 2;

      if (offset < 0) {
        offset = 0;
      }

      if (offset > maxScrollExtent) {
        offset = maxScrollExtent + itemHeight;
      }

      scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  static void scrollToTop(ScrollController scrollController) {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
