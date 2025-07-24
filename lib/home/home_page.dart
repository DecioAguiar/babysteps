import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFEDE1F7),
        foregroundColor: const Color(0xFF3E3666),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'config') {
                print("Configurações");
              } else if (value == 'sair') {
                print("Sair");
              }
            },
            itemBuilder:
                (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'config',
                    child: Row(
                      children: [
                        Icon(Icons.settings, color: Colors.black54),
                        SizedBox(width: 8),
                        Text('Configurações'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'sair',
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: Colors.black54),
                        SizedBox(width: 8),
                        Text('Sair'),
                      ],
                    ),
                  ),
                ],
          ),
        ],
      ),

      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFEDE1F7)),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                height: 450, // altura fixa para centralizar verticalmente
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF2E254D),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Menus",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildMenuItem(
                            context,
                            title: "Desenvolvimento infantil",
                            icon: Icons.baby_changing_station,
                            onTap: () {},
                          ),
                          const SizedBox(height: 16),
                          _buildMenuItem(
                            context,
                            title: "Definição dos domínios do bebê",
                            icon: Icons.description,
                            onTap: () {},
                          ),
                          const SizedBox(height: 16),
                          _buildMenuItem(
                            context,
                            title: "Técnicas de estimulação",
                            icon: Icons.play_circle_fill,
                            onTap: () {},
                          ),
                          const SizedBox(height: 16),
                          _buildMenuItem(
                            context,
                            title: "Alcançar marcos",
                            icon: Icons.calendar_today,
                            onTap: () {},
                            hasMic: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    bool hasMic = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFD7CFF2),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Row(
              children: [
                Icon(icon, size: 36, color: const Color(0xFF5D3B91)),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Color(0xFF5D3B91),
                ),
              ],
            ),
            if (hasMic)
              const Positioned(
                top: 4,
                right: 4,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Color(0xFF5D3B91),
                  child: Icon(
                    Icons.notifications,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
