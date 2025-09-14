import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<IconData> icons;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure at least two icons
    assert(
      icons.length >= 2,
      'AnimatedBottomNavigationBar requires at least two icons.',
    );
    return AnimatedBottomNavigationBar(
      icons: icons,
      activeIndex: currentIndex,
      gapLocation: GapLocation.none,
      onTap: onTap,
      backgroundColor: Colors.white,
      activeColor: Theme.of(context).primaryColor,
      inactiveColor: Colors.grey,
    );
  }
}
