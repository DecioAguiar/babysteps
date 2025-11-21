import 'package:flutter/material.dart';
import 'package:babysteps/education/question_detail_page.dart';

class TecnicasEstimulacaoPage extends StatelessWidget {
  const TecnicasEstimulacaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Técnicas de Estimulação'),
        backgroundColor: const Color(0xFFD5CCFF),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: const [
          AgeRangeTile(
            title: 'O que diz a Caderneta da Criança sobre estimular com afeto',
            page: QuestionDetailPage(
              question: 'O que diz a Caderneta da Criança sobre estimular com afeto',
              pages: [
                'A caderneta da criança disponibilizada pelo ministério da saúde traz um capítulo que aborda alternativas de como estimular o desenvolvimento da criança com afeto de acordo com a faixa etária. No BabySteps, você encontrará esses estímulos até o primeiro ano de vida.',
              ],
            ),
          ),
          AgeRangeTile(
            title: 'Nascimento aos 2 meses',
            page: QuestionDetailPage(
              question: 'Nascimento aos 2 meses',
              pages: [
                'A criança já consegue ouvir e reconhecer a voz de pessoas com quem tem mais contato e também enxerga com uma distância de até 20cm. Por isso, a primeira recomendação é sempre conversar com o bebê.',
                '• Escolha um objeto colorido e coloque a uma distância de 30cm e faça movimentos para que chame atenção do bebe.\n\n• Sempre olhe fixamente para o bebe quando for falar com ele.\n\n• Cante e coloque músicas pois o bebe se sente bem, alegre e o som lhe trará uma sinal de tranquilidade (pode ser canções de ninar e cantiga de roda).\n\n• Leia e conte histórias sempre que possível.\n\n• É importante oferecer objetos quando ela estiver de barriga para baixo para estimular a levantar o pescoço, mais isso eu te explico melhor na aba de “técnicas de estimulação”',
              ],
            ),
          ),
          AgeRangeTile(
            title: 'Entre 2 e 4 meses',
            page: QuestionDetailPage(
              question: 'Entre 2 e 4 meses',
              pages: [
                'Aqui você encontrará as técnicas de estimulação para bebês entre 2 e 4 meses.',
              ],
            ),
          ),
          AgeRangeTile(
            title: 'Entre 4 e 6 meses',
            page: QuestionDetailPage(
              question: 'Entre 4 e 6 meses',
              pages: [
                'Aqui você encontrará as técnicas de estimulação para bebês entre 4 e 6 meses.',
              ],
            ),
          ),
          AgeRangeTile(
            title: 'Entre 6 e 9 meses',
            page: QuestionDetailPage(
              question: 'Entre 6 e 9 meses',
              pages: [
                'Aqui você encontrará as técnicas de estimulação para bebês entre 6 e 9 meses.',
              ],
            ),
          ),
          AgeRangeTile(
            title: 'Entre 9 e 12 meses',
            page: QuestionDetailPage(
              question: 'Entre 9 e 12 meses',
              pages: [
                'Aqui você encontrará as técnicas de estimulação para bebês entre 9 e 12 meses.',
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AgeRangeTile extends StatelessWidget {
  final String title;
  final Widget page;

  const AgeRangeTile({
    super.key,
    required this.title,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}
