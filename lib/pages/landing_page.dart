import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState(){
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose(){
    super.dispose();
    _pageController.dispose();
  }

  void onTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
    print(_selectedIndex);
    _pageController.animateToPage(_selectedIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutQuad);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
        children: const [
          Text("First Screen"),
          Text("Second Screen"),
          Text("Third Screen"),
          Text("Fourth Screen")
        ],

      ),

      bottomNavigationBar: SlidingClippedNavBar.colorful(
        backgroundColor: Colors.white,
        onButtonPressed: onTapped,
        iconSize: 28,
        fontSize: 14,
        selectedIndex: _selectedIndex,
        barItems: [
          BarItem(
            icon: FluentSystemIcons.ic_fluent_home_regular,
            title: 'Home',
            activeColor: Colors.amber,
            inactiveColor: Colors.red,
          ),
          BarItem(
            icon: FluentSystemIcons.ic_fluent_search_regular,
            title: 'Search',
            activeColor: Colors.cyan,
            inactiveColor: Colors.green,
          ),
          BarItem(
            icon: FluentSystemIcons.ic_fluent_ticket_regular,
            title: 'Orders',
            activeColor: Colors.yellow,
            inactiveColor: Colors.red,
          ),
          BarItem(
            icon: FluentSystemIcons.ic_fluent_settings_dev_regular,
            title: 'Settings',
            activeColor: Colors.blue,
            inactiveColor: Colors.yellow,
          ),

        ],
      ),
    );
  }
}
