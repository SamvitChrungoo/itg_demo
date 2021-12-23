// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itg_demo/provider/bloc/itg_bloc.dart';
import 'package:itg_demo/screens/panchang_screen/panchang_home.dart';
import 'package:itg_demo/screens/talk_to_astrologer_screen/talk_to_astrologer_home.dart';
import 'package:itg_demo/utils/constants.dart';
import 'package:itg_demo/widgets/common_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late ITGBolc _itgBolc;
  late List<Widget> _screens;
  late PageController _pageController;

  @override
  void initState() {
    _itgBolc = BlocProvider.of<ITGBolc>(context);
    _screens = [
      PanchangScreen(bloc: _itgBolc),
      TalkToAstrologerScreen(bloc: _itgBolc),
    ];
    _pageController = PageController(initialPage: _selectedIndex);

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(_selectedIndex,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.grey[100],
        elevation: 0,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: kSelectedColor,
        unselectedItemColor: kUnselectedColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(kHomeIcon),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(kTalkIcon),
            ),
            label: 'Talk to Astrologer',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBar(),
            Expanded(
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                controller: _pageController,
                // physics: NeverScrollableScrollPhysics(),
                children: _screens,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
