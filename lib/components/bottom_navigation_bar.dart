import 'package:flutter/material.dart';
import 'package:ts_app/components/tab.dart';
import 'package:ts_app/general/box_decoration.dart';
import 'package:ts_app/general/colors.dart';
import 'package:ts_app/general/font_styles.dart';

class _Constant {
  static const barRadius = Radius.circular(20.0);
}

class DefaultBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final List<TabItem> tabItems;
  final Function(int) onIndexChanged;

  DefaultBottomNavigationBar({
    @required this.currentIndex,
    @required this.tabItems,
    @required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: _Constant.barRadius,
            topRight: _Constant.barRadius,
          ),
          boxShadow:
              AppBoxDecoration.defaultCardWithShadowBoxDecoration.boxShadow,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: _Constant.barRadius,
            topRight: _Constant.barRadius,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: FontStylez.selectedTabLabelLight,
            unselectedLabelStyle: FontStylez.unselectedTabLabelLight,
            unselectedItemColor: AppColors.textMain.withOpacity(0.4),
            selectedItemColor: AppColors.primaryAccent,
            items: tabItems
                .map(
                  (tab) => BottomNavigationBarItem(
                    icon: tab.icon(context),
                    activeIcon: tab.icon(context),
                    label: tab.label(context),
                  ),
                )
                .toList(),
            onTap: onIndexChanged,
            currentIndex: currentIndex,
          ),
        ),
      ),
    );
  }
}
