import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class MainBottomNavigationBarOrganism extends StatefulWidget {
  const MainBottomNavigationBarOrganism({
    super.key,
    required this.onTap,
    required this.currentIndex,
    required this.barItems,
  });
  final void Function(int) onTap;
  final int currentIndex;
  final List<BarItem> barItems;

  @override
  State<MainBottomNavigationBarOrganism> createState() => _MainBottomNavigationBarOrganismState();
}

class _MainBottomNavigationBarOrganismState extends State<MainBottomNavigationBarOrganism> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: context.colors.neutralWhite,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      unselectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      unselectedItemColor: const Color(0xFF424844),
      selectedItemColor: Colors.green,
      currentIndex: widget.currentIndex,
      iconSize: 18,
      onTap: widget.onTap,
      items: widget.barItems
          .map(
            (item) => NavigationBarItemMolecule(
              activeIcon: item.selectedTabIcon,
              icon: item.unselectedTabIcon,
              label: item.name,
            ),
          )
          .toList(),
    );
  }
}

class BarItem {
  const BarItem({
    required this.selectedTabIcon,
    required this.unselectedTabIcon,
    required this.name,
    required this.page,
  });
  final Widget selectedTabIcon;
  final Widget unselectedTabIcon;
  final String name;
  final Widget page;
}
