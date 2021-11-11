import 'package:desk/common/global/i_style.dart';
import 'package:desk/views/home/home_view.dart';
import 'package:desk/views/meet/meet_view.dart';
import 'package:desk/views/mine/home_mine_view.dart';
import 'package:desk/views/pages/homePage.dart' as h;
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
    controller: controller.tabController,
    screens: _buildScreens(),
    items: _navBarsItems(),
    confineInSafeArea: true,
    backgroundColor: Colors.white,
    handleAndroidBackButtonPress: true,
    resizeToAvoidBottomInset: true,
    stateManagement: true,
    navBarHeight: MediaQuery.of(Get.context!).viewInsets.bottom > 0
        ? 0.0
        : kBottomNavigationBarHeight,
    hideNavigationBarWhenKeyboardShows: true,
    margin: EdgeInsets.all(0.0),
    popActionScreens: PopActionScreensType.all,
    bottomScreenMargin: 0.0,
    onWillPop: (context) async {
      await showDialog(
        context: Get.context!,
        useSafeArea: true,
        builder: (context) => Container(
          height: 50.0,
          width: 50.0,
          color: Colors.white,
          child: ElevatedButton(
            child: Text("Close"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
      return false;
    },
    selectedTabScreenContext: (context) {
    },
    // hideNavigationBar: _hideNavBar,
    decoration: NavBarDecoration(
        colorBehindNavBar: Colors.indigo,
        borderRadius: BorderRadius.circular(20.0)),
    popAllScreensOnTapOfSelectedTab: true,
    navBarStyle:
    NavBarStyle.style15, // Choose the nav bar style with this property
  );

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: 'home'.tr,
        activeColorPrimary: IColors.primarySwatch,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ('selection'.tr),
        activeColorPrimary: IColors.primarySwatch,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.roofing),
          title: ('room'.tr),
        activeColorPrimary: IColors.primarySwatch,
          activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.grey,),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.message),
        title: ('meet'.tr),
        activeColorPrimary: IColors.primarySwatch,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_outline),
        title: ('mine'.tr),
        activeColorPrimary: IColors.primarySwatch,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
