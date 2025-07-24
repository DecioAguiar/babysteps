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
      extendBody: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 45), //padding bottom da nav
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFF443178),
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => _onItemTapped(0),
                icon: Image.asset(
                  'assets/icons/Usuário.png',
                  height: 32,
                  color:
                      _selectedIndex == 0
                          ? const Color(0xFFB9F4FC)
                          : Colors.white70,
                ),
              ),
              IconButton(
                onPressed: () => _onItemTapped(1),
                icon: Image.asset(
                  'assets/icons/Casa.png',
                  height: 32,
                  color:
                      _selectedIndex == 1
                          ? const Color(0xFFB9F4FC)
                          : Colors.white70,
                ),
              ),
              IconButton(
                onPressed: () => _onItemTapped(2),
                icon: Image.asset(
                  'assets/icons/Chat.png',
                  height: 32,
                  color:
                      _selectedIndex == 2
                          ? const Color(0xFFB9F4FC)
                          : Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
