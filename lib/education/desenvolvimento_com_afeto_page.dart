import 'package:flutter/material.dart';
import 'package:babysteps/education/question_detail_page.dart';

class DesenvolvimentoComAfetoPage extends StatelessWidget {
  const DesenvolvimentoComAfetoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DESENVOLVIMENTO COM AFETO'),
        backgroundColor: const Color(0xFFD5CCFF), // Matching app theme
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: const [
          QuestionTile(
            question: 'Desenvolvimento infantil, você já ouviu falar?',
            page: QuestionDetailPage(
              question: 'Desenvolvimento infantil, você já ouviu falar?',
              pages: [
                'É um processo evolutivo. É também sequencial, pois diariamente novas habilidades são aperfeiçoadas. Por exemplo: a criança primeiro engatinha, depois começa a dar os primeiros passos sem apoio e somente depois anda. Ela adquire uma capacidade e vai aperfeiçoando a mesma.',
                'O desenvolvimento infantil vai além de dados como peso e altura. É um indicador do crescimento cerebral, desenvolvimento de novas habilidades como o sentir, falar, engatinhar, andar, ou seja, é o processo de evolução da criança.',
                'Esse processo de desenvolvimento dura toda a vida e o que é adquirido na infância repercute na adolescência e vida adulta. Por esse motivo é importante que as crianças recebam um acompanhamento direcionado.',
                'A evolução de um cérebro de uma criança acontece a uma velocidade surpreendente, nos primeiros anos de vida ainda mais intensamente quando o ambiente de convivência é favorável à realização de estímulos e interações.',
                'É importante que a criança seja estimulada a aprender coisas novas dentro da idade correta, o que vai garantir uma melhor habilidade, agilidade, comunicação, coordenação motora, desenvolvimento de ritmo e equilíbrio corporal, capacidade de pensar e raciocinar.',
                'Por isso, é necessário que e o ambiente onde a criança cresce e se desenvolve seja organizado e ordenado para que ela viva experiências e se desenvolva de modo adequado.',
              ],
            ),
          ),
          QuestionTile(
            question: 'Você sabe o que são estímulos e como são classificados?',
            page: QuestionDetailPage(
              question: 'Você sabe o que são estímulos e como são classificados?',
              pages: [
                'Os estímulos são ações e atividades direcionadas que tem como objetivo auxiliar no desenvolvimento da criança seja ele físico, cognitivo, social e emocional. Podem ser por meio de jogos, brincadeiras, atividades lúdicas e até mesmo no convívio diário com conversas e interação com a criança.',
                'Estímulos físicos: os que trabalham habilidade, agilidade, coordenação motora fina e grossa (dançar, engatinhar, escrever, segurar objetos).',
                'Estímulos cognitivos: capacidade de raciocinar, memória, criatividade, linguagem, curiosidade (brincadeiras com quebra-cabeça, peças de montar, conversas e diálogos diários).',
                'Estímulos sensoriais: envolvem a audição, visão, tato, olfato e paladar favorecendo a percepção das sensações e sensibilidade (reações as músicas que escutam, percebem quando alguém chama, apresentam olhar fixo).',
                'Além da criança crescer e ficar mais forte, ela se desenvolve e ganha melhores condições de comunicação, movimentação, equilíbrio e fala. Por esse motivo, é necessário que os pais e cuidadores recebam um acompanhamento profissional para que sejam orientados (as) da melhor forma possível no processo de desenvolvimento motor, social, emocional e intelectual.',
              ],
            ),
          ),
          QuestionTile(
            question: 'Você acha que o local em que a criança vive pode influenciar?',
            page: QuestionDetailPage(
              question: 'Você acha que o local em que a criança vive pode influenciar?',
              pages: [
                'Durante os primeiros para que as principais características de como ela será sejam definidas e isso recebe influência do local onde ela vive. Mesmo quando muito pequena, a criança já recebe influencias do ambiente e começam a compreender e explorar tudo que está em sua volta. Por esse motivo, é importante que os pais e cuidadores conheçam sobre as alternativas de estimular a criança com afeto para que ela cresça ativa e saudável.',
                'O modo de agir, pensar, sentir, os valores e crenças são consequências do ambiente de convívio, por esse motivo a criança sempre será muito semelhante a família ela e a mesma reproduzirá. É importante que a rede de proteção social e de sobrevivência da criança oportunize um ambiente agradável a criança para que o seu desenvolvimento, principalmente o psicossocial seja aprimorado.',
                'As interações afetivas são importantes para todo o processo de desenvolvimento infantil e essas interações de afeto com adultos em sua rotina colaboram para que ela adquira habilidades para crescer e se desenvolver ativamente.',
              ],
            ),
          ),
          QuestionTile(
            question: 'Como posso fortalecer o vínculo com meu bebê?',
            page: QuestionDetailPage(
              question: 'Como posso fortalecer o vínculo com meu bebê?',
              pages: ['Fortalecer o vínculo com o bebê (ou "bonding") pode ser feito através de ações diárias como conversar, cantar, fazer contato visual, amamentar (se for o caso), dar banho com calma, e simplesmente passar tempo de qualidade juntos. A resposta consistente às necessidades do bebê é a chave.'],
            ),
          ),
          QuestionTile(
            question: 'Qual a importância do "olho no olho"?',
            page: QuestionDetailPage(
              question: 'Qual a importância do "olho no olho"?',
              pages: ['O contato "olho no olho" é uma das primeiras formas de comunicação entre a mãe/pai e o bebê. Ele fortalece o vínculo, ajuda o bebê a aprender sobre emoções e a desenvolver habilidades sociais. É um pilar da comunicação afetiva.'],
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionTile extends StatelessWidget {
  final String question;
  final Widget page;

  const QuestionTile({
    super.key,
    required this.question,
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
        title: Text(question, style: const TextStyle(fontWeight: FontWeight.w500)),
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
