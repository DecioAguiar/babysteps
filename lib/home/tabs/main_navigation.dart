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
  int _selectedIndex = 0;

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
      appBar: appBar,
      body: body,

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () => _onItemTapped(1), // Index 1 para a HomePage
        child: Container(
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
            color: Color(0xFFB9F4FC),
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
            shape: const AutomaticNotchedShape(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
              ),
            ),
            notchMargin: 0,
            color: AppTheme.primaryColor,
            child: SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                                  ? const Color(0xFFCCF1FF)
                                  : Colors.white70,
                        ),
                      ),
                    ),
                  ),
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
                                  ? const Color(0xFFCCF1FF)
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
