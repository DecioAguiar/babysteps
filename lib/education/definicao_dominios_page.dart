import 'package:flutter/material.dart';
import 'package:babysteps/education/question_detail_page.dart';

class DefinicaoDominiosPage extends StatelessWidget {
  const DefinicaoDominiosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Domínios do desenvolvimento'),
        backgroundColor: const Color(0xFFD5CCFF),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: const [
          DomainTile(
            title: 'Desenvolvimento motor',
            page: QuestionDetailPage(
              question: 'Desenvolvimento motor',
              pages: [
                'O desenvolvimento motor é classificado de duas formas: motricidade fina e motricidade grossa.',
                'Motricidade fina: se refere aos movimentos mais delicados e precisos. Está relacionado a capacidade da criança em pegar pequenos objetos, como por exemplo um brinquedo ou uma caneta, além da capacidade de desenhar e pintar.',
                'Motricidade grossa: diz respeito às capacidades mais amplas do corpo que a criança consegue executar, como subir e descer batentes e escadas, pular, correr mantendo o equilíbrio de seu corpo.',
                'Para cada nova habilidade que a criança alcança, sejam relacionadas a motricidade fina ou grossa surgem no próprio tempo. No entanto, é importante que essas conquistas aconteçam dentro do período esperado para a idade, de forma sequencial e em um ritmo único de desenvolvimento de cada criança. Para isso, a Caderneta da Criança, orienta sobre a ordem lógica de como o desenvolvimento motor deve ocorrer, na parte II – Acompanhando o desenvolvimento.',
              ],
            ),
          ),
          DomainTile(
            title: 'Desenvolvimento da linguagem e da fala',
            page: QuestionDetailPage(
              question: 'Linguagem e fala',
              pages: [
                'É importante compreender que a habilidade de falar vem depois da compreensão da linguagem. Ou seja, a criança primeiro entende o que ouve, para depois começar a falar.',
                'O desenvolvimento da fala é caracterizado por uma evolução natural e sequencial. Então, primeiro o bebê vai reproduzir sons e brincar com o som da própria voz, para depois, começar a juntar sons (balbuciar) como “da-da” ou “ba-ba”.',
                'Essas etapas fazem parte do processo esperado do desenvolvimento da fala. Apesar de cada criança ter o seu ritmo, é importante ficar atento pois essas habilidades devem surgir dentro do período indicado para cada faixa etária. Para isso, a Caderneta da Criança, orienta sobre a ordem lógica de como o desenvolvimento da fala deve ocorrer, na parte II – Acompanhando o desenvolvimento.',
              ],
            ),
          ),
          DomainTile(
            title: 'Desenvolvimento cognitivo',
            page: QuestionDetailPage(
              question: 'Desenvolvimento cognitivo',
              pages: [
                'O desenvolvimento cognitivo está relacionado em como a criança pensa, aprende e compreende sobre as situações que lhe são expostas. Em resumo, é o amadurecimento intelectual do pensar e agir.',
                'Por meio do desenvolvimento intelectual a criança começa a reconhecer situações, pessoas e objetos e a partir disso, fazer associações e imitar comportamentos e hábitos. Assim como os demais domínios, as conquistas cognitivas devem acontecer de forma gradual e dentro do período esperado. Para isso, a Caderneta da Criança, orienta sobre a ordem lógica de como o desenvolvimento cognitivo deve ocorrer, na parte II – Acompanhando o desenvolvimento.',
              ],
            ),
          ),
          DomainTile(
            title: 'Desenvolvimento socioemocional',
            page: QuestionDetailPage(
              question: 'Desenvolvimento socioemocional',
              pages: [
                'O desenvolvimento socioemocional está estritamente relacionado a fase de desenvolvimento da criança. Isso porque em cada fase a criança apresenta um humor e temperamento variado.',
                'Esse domínio diz respeito a forma como a criança se comporta e expressa suas emoções com diferentes situações do seu dia a dia.',
                'Com o tempo, a criança passa a demonstrar sentimentos como alegria, medo, desconfiança, frustação, confiança, aprendendo de forma gradual a lidar com cada um deles. Para isso, a Caderneta da Criança, orienta sobre como cuidar e estimular com afeto além da ordem lógica de como o desenvolvimento socioemocional deve ocorrer, na parte II – Acompanhando o desenvolvimento.',
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DomainTile extends StatelessWidget {
  final String title;
  final Widget page;

  const DomainTile({
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
