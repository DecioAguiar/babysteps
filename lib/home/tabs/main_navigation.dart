import 'package:flutter/material.dart';
import '../home_page.dart';
import 'baby_info_tab.dart';
import 'package:babysteps/chat/chat_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [BabyInfoTab(), HomePage(), ChatPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () => _onItemTapped(1), // icon home
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: const Color(0xFFB9F4FC),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Image.asset(
              'assets/icons/Casa.png',
              height: 100,
              color: const Color(0xFF443178),
            ),
          ),
        ),
      ),

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
          child: BottomAppBar(
            shape: AutomaticNotchedShape(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
              ),
            ),
            notchMargin: 0,
            color: Color(0xFF443178),
            child: SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // icon info do bebe
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Center(
                      child: GestureDetector(
                        onTap: () => _onItemTapped(0),
                        child: Image.asset(
                          'assets/icons/Usuário.png',
                          height: 42,
                          color:
                              _selectedIndex == 0
                                  ? Color(0xFFCCF1FF)
                                  : Colors.white70,
                        ),
                      ),
                    ),
                  ),
                  // icon do chat
                  Padding(
                    padding: const EdgeInsets.only(right: 32.0),
                    child: Center(
                      child: GestureDetector(
                        onTap: () => _onItemTapped(2),
                        child: Image.asset(
                          'assets/icons/Chat.png',
                          height: 42,
                          color:
                              _selectedIndex == 2
                                  ? Color(0xFFCCF1FF)
                                  : Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
