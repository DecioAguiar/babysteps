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
            question: 'Você sabe porque é necessário que a criança se sinta amada por quem convive com ela?',
            page: QuestionDetailPage(
              question: 'Você sabe porque é necessário que a criança se sinta amada por quem convive com ela?',
              pages: [
                'Para que esta sinta-se segura para explorar o ambiente e consequentemente adquirir as capacidades necessárias ao seu desenvolvimento.',
                'Aqui vão algumas dicas: converse, leia em voz alta, faça perguntas do tipo “cadê a mamãe”, “cadê o papai”, “cadê o auau”, envolva a criança em diálogos, abrace, faça com que ela participe de todos os momentos, criando um ambiente de interação para que as necessidades físicas, afetivas, sociais, cognitivas e da linguagem sejam desenvolvidas.',
                'Atenção: É preciso que a criança descubra novas coisas e seja curiosa mas ela não pode ultrapassar os limites para a idade dela, por isso, irei te explicar lá na nossa conversa, sobre o que deve ser feito em cada fase da vida.',
                'Você sabia? A birra e desobediência quando a criança é repreendia por não poder fazer algo é normal. Chamamos isso de atitude de autoafirmação. Deixe ela expressar suas emoções mais também coloque limites de maneira adequada.',
                'Atenção: A criança observa a comunicação e relação entre as pessoas, por isso, evite falar com tom de voz mais alterado e também evite que a criança presencie momentos conflituosos pois ela pode acabar imitando comportamentos do tipo por achar que são corretos. A discussão e demonstrações agressivas devem ser evitadas!',
              ],
            ),
          ),
          QuestionTile(
            question: 'O padrão de sono também deve ser observado. Você sabia que o sono pode demonstrar algum sinal de alerta para problemas que podem afetar o desenvolvimento da criança?',
            page: QuestionDetailPage(
              question: 'O padrão de sono também deve ser observado. Você sabia que o sono pode demonstrar algum sinal de alerta para problemas que podem afetar o desenvolvimento da criança?',
              pages: [
                'Quando recém nascidos, o sono é constante e mais curto, tanto durante o dia quanto a noite. Quando as semanas vão passando, esse sono começa a diminuir e a criança fica acordada por mais tempo.',
                'Aos 6 meses é normal que a criança comece a estabelecer melhor os padrões de sono. Ao longo do dia as horas de sono vão diminuindo e consequentemente a noite também.',
                'O quanto antes uma rotina de sono tranquila deve ser programada com a diminuição do movimento dentro de casa ou próximo ao cômodo onde a criança repousará e iluminação reduzida é também importante. Se todas as noites a mesma “programação” acontecer, ela ficará habituada e isso poderá melhorar a qualidade e padrão do sono. Portanto, o ambiente silencioso, o banho e após a refeição, a contação de histórias e a música ajudam a criança a relaxar e compreender que chegou o momento de descanso. Evite exposição a telas, isso pode prejudicar e reduzir a qualidade do sono.',
                'Verifique como anda o padrão de sono da criança e perceba se isso está diferente do que é ideal pois essa alteração no padrão pode prejudicar o processo de desenvolvimento. Se forem percebidas alterações ou dificuldades para dormir, tente tornar esse ritual do sono um padrão. Ainda assim, se a criança não responder de forma positiva, procure um profissional.',
              ],
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
