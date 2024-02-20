import 'package:doctors_appointment/view/SignUp_view/SignUp_view.dart';
import 'package:doctors_appointment/view/home_view/home_view.dart';
import 'package:doctors_appointment/view/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../Categary_Screen/Categary_Screen.dart';
import '../settings_view/Settings_view.dart';
class NavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: 0),
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.lightBlue.shade200,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration:const NavBarDecoration(
        colorBehindNavBar: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10)
        )
      ),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeView(),
      CategoryScreen(),
      SignUpView(),
      SettingsView(),

    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: 'Home',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.category_outlined),
        title: 'Category',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_outline),
        title: 'Doctor',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
      icon: Icon(Icons.settings_outlined),
    title: 'Profile',
    activeColorPrimary: Colors.blue,
    inactiveColorPrimary: Colors.white,
    ),
    ];
  }
}