import 'package:desk/common/global/config.dart';
import 'package:desk/common/global/i_style.dart';
import 'package:desk/common/icon/antd_icons.dart';
import 'package:desk/views/home/home_view.dart';
import 'package:desk/views/meet/meet_view.dart';
import 'package:desk/views/mine/home_mine_view.dart';
import 'package:desk/views/room/room_view.dart';
import 'package:desk/views/selection/selection_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'index_logic.dart';

class IndexPage extends GetView<IndexLogic> {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => _indexView;

  List<Widget> _buildScreens() {
    return const <Widget>[
      HomePage(),
      SelectionPage(),
      RoomPage(),
      MeetPage(),
      HomeMinePage(),
    ];
  }

  Widget get _indexView => PersistentTabView(
        Get.context!,
        // controller: controller.tabController,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Get.theme.backgroundColor,
        navBarHeight: 60,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Get.theme.backgroundColor,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        // screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        //   animateTabTransition: true,
        //   curve: Curves.ease,
        //   duration: Duration(milliseconds: 200),
        // ),
        navBarStyle:
            NavBarStyle.style17, // Choose the nav bar style with this property.
      );

  List<PersistentBottomNavBarItem> _navBarsItems() {
    double size = Config.iconNormalSize;
    return [
      PersistentBottomNavBarItem(
        // icon: Icon(CupertinoIcons.home, size: size,),
        inactiveIcon: const Icon(Icons.apps),
        icon: const Icon(Icons.apps, color: IColors.primarySwatch),
        title: 'home'.tr,
        // onPressed: (_) => controller.selectIndex(0),
        activeColorPrimary: IColors.primarySwatch,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Icons.apps),
        icon: const Icon(Icons.apps, color: IColors.primarySwatch),
        title: 'selection'.tr,
        // onPressed: (_) => controller.selectIndex(1),
        activeColorPrimary: IColors.primarySwatch,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        // icon: Icon(CupertinoIcons.doc_text_search, size: size),
        // inactiveIcon: const Icon(Icons.apps),
        icon: const Icon(Icons.apps, color: IColors.primarySwatch),
        // title: 'room'.tr,
        // onPressed: (_) => controller.selectIndex(2),
        activeColorPrimary: IColors.primarySwatch,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        // icon: Icon(CupertinoIcons.doc_text_search, size: size),
        inactiveIcon: const Icon(Icons.apps),
        icon: const Icon(Icons.apps, color: IColors.primarySwatch),
        title: 'meet'.tr,
        // onPressed: (_) => controller.selectIndex(3),
        activeColorPrimary: IColors.primarySwatch,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        // icon: Icon(CupertinoIcons.doc_text_search, size: size),
        inactiveIcon: const Icon(Icons.apps),
        icon: const Icon(Icons.apps, color: IColors.primarySwatch),
        title: 'mine'.tr,
        // onPressed: (_) => controller.selectIndex(4),
        activeColorPrimary: IColors.primarySwatch,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  _navIcon(name, {color}) => const Icon(Icons.apps);
}
