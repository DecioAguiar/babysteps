import 'package:flutter/material.dart';
import 'package:babysteps/core/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 130),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  const Text(
                    "Menus",
                    style: TextStyle(
                      color: AppTheme.backgroundColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: [
                        _buildMenuItem(
                          context,
                          title: "Desenvolvimento infantil",
                          icon: Icons.baby_changing_station,
                          onTap: () {},
                        ),
                        _buildMenuItem(
                          context,
                          title: "Definição dos domínios do bebê",
                          icon: Icons.description,
                          onTap: () {},
                        ),
                        _buildMenuItem(
                          context,
                          title: "Técnicas de estimulação",
                          icon: Icons.play_circle_fill,
                          onTap: () {},
                        ),
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
    );
  }

  // O método _buildMenuItem pode continuar aqui, pois é usado apenas pela HomePage.
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
          color: AppTheme.backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(129, 0, 0, 0),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 40, color: const Color(0xFF5D3B91)),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),
            if (hasMic)
              const Positioned(
                top: 4,
                right: 4,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Color(0xFF5D3B91),
                  child: Icon(
                    Icons.notifications,
                    size: 14,
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
