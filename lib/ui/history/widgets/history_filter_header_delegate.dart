import 'package:flutter/material.dart';

import '../state/history_state.dart';
import 'history_segmented_control.dart';

class HistoryFilterHeaderDelegate extends SliverPersistentHeaderDelegate {
  final HistoryFilter selected;
  final ValueChanged<HistoryFilter> onChanged;

  HistoryFilterHeaderDelegate({
    required this.selected,
    required this.onChanged,
  });

  @override
  double get minExtent => 56;

  @override
  double get maxExtent => 56;

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(bottom: 8),
      child: HistorySegmentedControl(
        selected: selected,
        onChanged: onChanged,
      ),
    );
  }

  @override
  bool shouldRebuild(covariant HistoryFilterHeaderDelegate oldDelegate) {
    return oldDelegate.selected != selected;
  }
}