import 'package:flutter/material.dart';
import 'package:babysteps/core/theme.dart';
import '../home_page.dart';
import 'baby_info_tab.dart';
import 'package:babysteps/chat/chat_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 1;

  final List<Widget> _screens = const [BabyInfoTab(), HomePage(), ChatPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  AppBar _buildRegularAppBar() {
    final appBarTheme = Theme.of(context).appBarTheme;
    return AppBar(
      title: Text(_getAppBarTitle(), style: appBarTheme.titleTextStyle),
      centerTitle: true,
      backgroundColor: appBarTheme.backgroundColor,
      foregroundColor: appBarTheme.iconTheme?.color,
      elevation: 0,
    );
  }

  Widget _buildSliverAppBar() {
    final appBarTheme = Theme.of(context).appBarTheme;
    return SliverAppBar(
      title: Text(_getAppBarTitle(), style: appBarTheme.titleTextStyle),
      centerTitle: true,
      backgroundColor: appBarTheme.backgroundColor,
      foregroundColor: appBarTheme.iconTheme?.color,
      elevation: 0,
      floating: true, // Efeito desejado para a tela de Chat
      snap: true,
    );
  }

  // Método auxiliar para pegar o título de qualquer tela
  String _getAppBarTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Informações do bebê';
      case 1:
        return 'Página Inicial';
      case 2:
        return 'Chat';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget? appBar;
    Widget body;

    // AGRUPAMOS AS TELAS ESTÁTICAS (0 e 1)
    if (_selectedIndex == 0 || _selectedIndex == 1) {
      appBar = _buildRegularAppBar();
      body = _screens[_selectedIndex];
    } else {
      // A TELA DE CHAT (2) É A ÚNICA COM ROLAGEM
      appBar = null;
      body = CustomScrollView(
        slivers: <Widget>[
          _buildSliverAppBar(),
          SliverFillRemaining(child: _screens[_selectedIndex]),
        ],
      );
    }
    return Scaffold(
      extendBody: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20), //padding bottom da nav
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
