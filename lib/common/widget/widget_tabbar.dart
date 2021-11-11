import 'package:desk/common/global/i_style.dart';
import 'package:flutter/material.dart';

// import 'tabs_repair_shake.dart' as Custom;

class BaseTabBar extends StatelessWidget {
  final TabController tabController;
  final List<Tab> tabs;

  const BaseTabBar({Key? key, required this.tabController, required this.tabs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: IColors.primarySwatch,
      labelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      unselectedLabelStyle:
          const TextStyle(color: IColors.unselectedText, fontSize: 14),
      indicatorWeight: 1,
      labelPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: IColors.subLightTextColor,
      labelColor: IColors.primarySwatch,
      // indicatorPadding: EdgeInsets.all(8),
      indicator: const UnderlineTabIndicator(
        insets: EdgeInsets.all(8),
        borderSide: BorderSide(
          width: 2,
          color: IColors.primarySwatch,
        ),
      ),
      tabs: tabs,
      controller: tabController,
    );
  }
}
