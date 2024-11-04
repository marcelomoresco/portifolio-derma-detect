import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class MainTemplate extends StatefulWidget {
  const MainTemplate({
    super.key,
    required this.barItems,
    required this.currentIndex,
    required this.onTabTap,
  });
  final List<BarItem> barItems;
  final int currentIndex;
  final void Function(int index) onTabTap;

  @override
  State<MainTemplate> createState() => _MainTemplateState();
}

class _MainTemplateState extends State<MainTemplate> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _changePage(0));
  }

  void _changePage(int index) {
    widget.onTabTap(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: widget.currentIndex,
        children: widget.barItems.map((barItem) => barItem.page).toList(),
      ),
      bottomNavigationBar: MainBottomNavigationBarOrganism(
        barItems: widget.barItems,
        currentIndex: widget.currentIndex,
        onTap: _changePage,
      ),
    );
  }
}
