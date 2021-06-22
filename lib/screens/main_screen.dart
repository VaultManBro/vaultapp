import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:ts_app/components/bottom_navigation_bar.dart';
import 'package:ts_app/components/non_animated_material_page_route.dart';
import 'package:ts_app/components/tab.dart';
import 'package:ts_app/general/box_decoration.dart';
import 'package:ts_app/general/colors.dart';
import 'package:ts_app/general/font_styles.dart';
import 'package:ts_app/general/routes.dart';
import 'package:ts_app/models/product_model.dart';
import 'package:ts_app/providers/general.dart';

class AuthenticatedAppNavigationProvider
    with ChangeNotifier, DiagnosticableTreeMixin {
  final tabs = TabItemExtension.allTabs;
  final rootRoutes = [TabItem.home, TabItem.cart, TabItem.info];

  TabItem _currentTab = TabItem.home;
  bool _isBottomBarHidden = false;

  TabItem get currentTab => _currentTab;
  int get currentTabIndex => tabs.indexOf(currentTab) ?? 0;
  bool get isBottomBarHidden => _isBottomBarHidden;

  PersistentTabController controller;

  void setCurrentTab(TabItem tab) {
    if (tabs.contains(tab) == false) {
      return;
    }

    _currentTab = tab;
    controller.jumpToTab(currentTabIndex);
    notifyListeners();
  }

  void reset() {
    _currentTab = TabItem.home;
    _isBottomBarHidden = false;
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with TickerProviderStateMixin<MainScreen>, NavigatorObserver {
  AuthenticatedAppNavigationProvider _provider;

  @override
  void initState() {
    super.initState();

    _provider =
        Provider.of<AuthenticatedAppNavigationProvider>(context, listen: false);
    _provider.controller =
        PersistentTabController(initialIndex: _provider.currentTabIndex);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _provider.controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.secondarySwatch,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow:
            AppBoxDecoration.defaultCardWithShadowBoxDecoration.boxShadow,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: false,
        curve: Curves.linear,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    final allRoutes = Routes.getRoutes();

    return [
      allRoutes[Routes.home](context),
      allRoutes[Routes.order](context),
      allRoutes[Routes.info](context)
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    var items = _provider.tabs.map((tab) {
      return PersistentBottomNavBarItem(
        icon: tab.icon(context),
        title: tab.label(context),
        activeColor: AppColors.primaryAccent,
        inactiveColor: AppColors.textMain.withOpacity(0.4),
        iconSize: 20,
        textStyle: FontStylez.unselectedTabLabelLight,
      );
    }).toList();
    return items;
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         top: false,
//         child: Navigator(
//           key: _navigatorKey,
//           onGenerateRoute: generateRoute,
//           observers: [this],
//         ),
//       ),
//       bottomNavigationBar:
//           _isBottomBarHidden ? SizedBox(height: 0) : _bottomNavigationBar(),
//     );
//   }

//   Widget _bottomNavigationBar() {
//     return DefaultBottomNavigationBar(
//       currentIndex: _currentTabIndex,
//       tabItems: _tabs,
//       onIndexChanged: _onTap,
//     );
//   }

//   _onTap(int tabIndex) {
//     if (_currentTabIndex == tabIndex) {
//       return;
//     }

//     final tab = TabItemExtension.fromRawValue(tabIndex);

//     if (tab == null) {
//       return;
//     }

//     _navigatorKey.currentState.pushReplacementNamed(tab.rootRouteName());

//     setState(() {
//       _currentTabIndex = tabIndex;
//     });
//   }

//   Route<dynamic> generateRoute(RouteSettings settings) {
//     final allRoutes = Routes.getRoutes();

//     if (settings.name == '/') {
//       return NonAnimatedMaterialPageRoute(
//           builder: allRoutes[Routes.home], settings: settings);
//     } else if ([
//       Routes.home,
//       Routes.cart,
//       Routes.info,
//     ].contains(settings.name)) {
//       return NonAnimatedMaterialPageRoute(
//           builder: allRoutes[settings.name], settings: settings);
//     } else {
//       setState(() {
//         _isBottomBarHidden = true;
//       });

//       return MaterialPageRoute(
//           builder: allRoutes[settings.name], settings: settings);
//     }
//   }

//   @override
//   void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
//     if (_tabs
//         .map((e) => e.rootRouteName())
//         .toList()
//         .contains(previousRoute.settings.name)) {
//       setState(() {
//         _isBottomBarHidden = false;
//       });
//     }
//   }
// }
