import 'package:flutter/material.dart';
import 'package:babysteps/core/theme.dart';

class BabyInfoTab extends StatelessWidget {
  const BabyInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.backgroundColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: CircleAvatar(
                radius: 64,
                backgroundColor: AppTheme.primaryColor,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white70,
                  backgroundImage: AssetImage('assets/icons/asiaticBaby.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Bebê asiática',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textColor,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // --- Widgets de Informação ---
            const InfoBar(label: 'Idade', value: '0/12 Meses', progress: 0.0),
            const InfoBar(label: 'Peso ao nascer', value: '3 kg'),
            const InfoBar(label: 'Peso atual', value: '8 kg'),
            const InfoBar(label: 'Altura ao nascer', value: '50 cm'),
            const InfoBar(label: 'Altura atual', value: '80 cm'),

            // --- Campos de Seleção ---
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Tipo de parto',
                labelStyle: const TextStyle(color: AppTheme.textColor),
                filled: true,
                // AGORA: Usando uma cor do tema com opacidade
                fillColor: AppTheme.primaryColor.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),
              value: 'Natural',
              items:
                  ['Natural', 'Cesáreo']
                      .map(
                        (label) =>
                            DropdownMenuItem(value: label, child: Text(label)),
                      )
                      .toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Motivo do parto cesáreo (S/N)',
                labelStyle: const TextStyle(color: AppTheme.textColor),
                filled: true,
                fillColor: AppTheme.primaryColor.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),
              value: 'Opções',
              items:
                  ['Opções', 'Sim', 'Não']
                      .map(
                        (label) =>
                            DropdownMenuItem(value: label, child: Text(label)),
                      )
                      .toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// Widget InfoBar refatorado para usar o AppTheme
class InfoBar extends StatelessWidget {
  final String label;
  final String value;
  final double progress;

  const InfoBar({
    super.key,
    required this.label,
    required this.value,
    this.progress = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            // AGORA: Usando o estilo de texto padrão do tema
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    width: constraints.maxWidth * progress,
                    height: 40,
                    decoration: BoxDecoration(
                      // AGORA: Cor baseada na cor primária do tema
                      color: AppTheme.primaryColor.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  value,
                  style: const TextStyle(
                    // AGORA: Usando a cor secundária do tema
                    color: AppTheme.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
